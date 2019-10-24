# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils user git-r3 dotnet systemd

DESCRIPTION="Emby Server (formerly known as MediaBrowser Server) is a software that indexes a lot of different kinds of media and allows for them to be retrieved and played through the DLNA protocol on any device capable of processing them."
HOMEPAGE="http://emby.media/"
KEYWORDS="-* ~arm ~amd64 ~x86"
SRC_URI="https://github.com/MediaBrowser/Emby/archive/${PV}.tar.gz"
SLOT="0"
LICENSE="GPL-2"
RESTRICT="mirror test"

RDEPEND=">=dev-lang/mono-5.4.0
	>=media-video/ffmpeg-2[vpx]
	media-gfx/imagemagick[jpeg,jpeg2k,webp,png]
	!media-tv/mediabrowser-server
	>=dev-db/sqlite-3.0.0
	dev-dotnet/referenceassemblies-pcl
	app-misc/ca-certificates"
DEPEND="app-arch/unzip
	${RDEPEND}"

INSTALL_DIR="/opt/emby-server"
DATA_DIR="/var/lib/emby-server"
STARTUP_LOG="/var/log/emby-server_start.log"
INIT_SCRIPT="${ROOT}/etc/init.d/emby-server"

# INSTALL
# #######################################################################################################

pkg_setup() {
	einfo "creating user for Emby"
	enewgroup emby
	enewuser emby -1 /bin/bash ${INSTALL_DIR} "emby"

	einfo "updating root certificates for mono certificate store"
        addwrite "/usr/share/.mono/keypairs"
	dotnet_pkg_setup
        cert-sync /etc/ssl/certs/ca-certificates.crt
}

# gentoo expects a specific subfolder in the working directory for the extracted source, so simply extracting won't work here
src_unpack() {
        unpack ${A}
        mv Emby-${PV} emby-server-${PV}
}

src_prepare() {
	# the user can define the quality of the imagemagic himself, here we try to figure out the correct files to use in our configuration
	MAGICKWAND=$(ldconfig -p | grep MagickWand.*.so$ | cut -d" " -f4)
	MAGICKWAND=${MAGICKWAND##*/}
	einfo "adapting to imagemagick library to: ${MAGICKWAND}"
	sed -i -e "s/\"libMagickWand-6.Q8.so\"/\"${MAGICKWAND}\"/" MediaBrowser.Server.Mono/ImageMagickSharp.dll.config || die "could not update libMagickWand reference!"
}


src_compile() {
	addpredict "/etc/mono/registry"
	xbuild /p:Configuration="Release Mono" /p:Platform="Any CPU" MediaBrowser.sln || die "building failed"
}

src_install() {
	einfo "installing compiled files"
	diropts -oemby -gemby
	dodir ${INSTALL_DIR}
	cp -R ${S}/MediaBrowser.Server.Mono/bin/Release/* ${D}${INSTALL_DIR}/ || die "install failed, possibly compile did not succeed earlier?"
	cp "${FILESDIR}"/emby-server ${D}${INSTALL_DIR}/
	chown emby:emby -R ${D}${INSTALL_DIR}

	einfo "prepare data directory"
	dodir ${DATA_DIR}

	einfo "preparing basic configuration"
	newconfd "${FILESDIR}"/emby-server.conf ${PN}

	einfo "preparing init scripts"
	newinitd "${FILESDIR}"/emby-server.init_3  ${PN}
	systemd_dounit "${FILESDIR}/3.4/emby-server.service"
	systemd_install_serviced "${FILESDIR}/3.4/emby-server.service.conf"

	einfo "preparing startup log file"
	dodir /var/log/
	touch ${D}${STARTUP_LOG}
	chown emby:emby ${D}${STARTUP_LOG}
}

pkg_postinst() {
	einfo "emby-server was installed to ${INSTALL_DIR}, to start please use the init script provided."
	einfo "All data generated and used by Emby can be found at ${DATA_DIR} after the first start."
	einfo ""

	if systemd_is_booted; then
		ewarn "You seem to be running on systemd, to configure the service please refer to \"/etc/systemd/system/emby-server.service.d/00gentoo.conf\"."
		ewarn "Changing /etc/conf.d/emby-server.conf will have no effect!"
	fi

	if [[ -d "/usr/lib/mediabrowser-server" || -h "/usr/lib/mediabrowser-server" ]]; then
		ewarn "ATTENTION: You seem to have moved from the former mediabrowser-server package:"
		ewarn "don't forget to migrate your original data directory before the first start!"
		ewarn "To do that move"
		ewarn "     /usr/lib/mediabrowser-server"
		ewarn "to"
		ewarn "     ${DATA_DIR}"
		ewarn "and change owner status from mediabrowser:mediabrowser to emby:emby!"
		ewarn "     chown -R emby:emby ${DATA_DIR}"
	fi

	if [[ -d "/usr/lib/emby-server" || -h "/usr/lib/emby-server"  ]]; then
		ewarn "ATTENTION: You seem to have existing program data at /usr/lib/emby-server!"
		ewarn "Please move that folder to ${DATA_DIR} before the first start and make sure the folder is owned by emby:emby"
		ewarn "The folder /usr/lib/emby-server will be repurposed in one of the next releases, so make sure to clean that directory up!"
	fi
}

# UNINSTALL
# #######################################################################################################

pkg_prerm() {
	einfo "Stopping running instances of Emby Server"
	if [ -e "${INIT_SCRIPT}" ]; then
		${INIT_SCRIPT} stop
	fi
}
