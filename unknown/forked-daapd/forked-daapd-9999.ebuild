# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils autotools git

DESCRIPTION="DAAP and RSP media server. It is a complete rewrite of mt-daapd (Firefly Media Server)."
HOMEPAGE="http://www.technologeek.org/projects/daapd/index.html"
EGIT_REPO_URI="git://git.debian.org/users/jblache/forked-daapd.git"
#SRC_URI="http://omploader.org/vNTA2Zw/${P}.tar.bz2"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="flac itunes musepack"

DEPEND="${RDEPEND}
	dev-vcs/git[curl]
	dev-util/pkgconfig"

RDEPEND="flac? ( media-libs/flac )
	itunes? ( >=app-pda/libplist-0.16 )
	musepack? ( media-libs/taglib )
	dev-db/sqlite:3[unlock-notify,threadsafe]
	>=dev-libs/avl-0.3.5
	dev-libs/confuse
	dev-libs/libevent
	>=dev-libs/libantlr3c-3.1.3
	dev-libs/libgcrypt
	dev-libs/mini-xml
	>=dev-libs/libunistring-0.9.3
	media-video/ffmpeg
	>=sys-libs/zlib-1.2.5-r2"
#	net-dns/avahi

src_unpack() {
	git_src_unpack
	cd ${S}
}

src_prepare() {
	cp "${FILESDIR}"/${PN}.init.2 initd
	eautoreconf || die
}


src_configure() {
	econf $(use_enable flac) \
	      $(use_enable itunes)\
	      $(use_enable musepack)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."

	newinitd "${FILESDIR}/${PN}.init.2" ${PN} || die
#	newinitd initd ${PN} || die
	keepdir /etc/forked.daapd.d /var/cache/forked-daapd || die
	dodoc AUTHORS ChangeLog README NEWS || die
}

pkg_preinst() {
	enewgroup daapd
	enewuser daapd -1 -1 /dev/null daapd
	fowners -R daapd:daapd /etc/forked.daapd.d
	fowners -R daapd:daapd /var/cache/forked-daapd
	fperms -R 0700 /etc/forked.daapd.d
	fperms -R 0700 /var/cache/forked-daapd
}

pkg_postinst() {
	einfo
	elog "If you want to start more than one ${PN} service, symlink"
	elog "/etc/init.d/${PN} to /etc/init.d/${PN}.<name>, and it will"
	elog "load the data from /etc/${PN}.d/<name>.conf."
	elog "Make sure that you have different cache directories for them."
	einfo
}

