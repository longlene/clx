# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1
JAVA_PKG_IUSE="source"

inherit eutils java-pkg-2 java-ant-2 toolchain-funcs flag-o-matic fdo-mime gnome2-utils

MY_P="${PN}-src-${PV}"
DESCRIPTION="TuxGuitar is a multitrack guitar tablature editor and player written in Java-SWT"
HOMEPAGE="http://www.tuxguitar.com.ar/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
IUSE="alsa fluidsynth ftp oss pdf"

KEYWORDS="~amd64 ~x86"

CDEPEND=">=dev-java/swt-3.4
	alsa? ( media-libs/alsa-lib )
	fluidsynth? ( media-sound/fluidsynth )
	pdf? ( dev-java/itext:0 )"

RDEPEND=">=virtual/jre-1.6
	alsa? ( media-sound/timidity++ )
	oss? ( media-sound/timidity++ )
	${CDEPEND}"

DEPEND=">=virtual/jdk-1.6
	${CDEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	if ! built_with_use 'dev-java/swt' 'cairo'; then
		eerror "You must build dev-java/swt with cairo support"
		die "dev-java/swt built without cairo"
	fi
	java-pkg-2_pkg_setup
}

src_unpack() {
 
	unpack ${A}
	cd "${S}/TuxGuitar/lib"
	java-pkg_jar-from swt-3.4
}

src_compile() {
	if use pdf; then
		echo "" >> TuxGuitar-pdf/build.properties || die
		echo "path.itext=$(java-pkg_getjar itext iText.jar)" >> TuxGuitar-pdf/build.properties || die "Error adding itext path"
		echo "path.swt=$(java-pkg_getjar swt-3.4 swt.jar)" >> TuxGuitar-pdf/build.properties || die "Error adding swt path"
	fi
	cd TuxGuitar || die "cd failed"
	eant all
	for plugin in $(list_plugins); do
		plugin_compile $plugin
	done
}

src_install() {
	cd TuxGuitar || die "cd failed"
	java-pkg_dojar tuxguitar.jar
	use source && java-pkg_dosrc src/org

	java-pkg_dolauncher ${PN} \
		--main org.herac.tuxguitar.gui.TGMain \
		--java_args "-Xms128m -Xmx128m"

	insinto /usr/share/${PN}/lib
	doins -r share || die "doins failed"
	java-pkg_sointo /usr/share/${PN}/lib/lib
	for plugin in $(list_plugins); do
		plugin_install $plugin
	done
	doman "${S}/misc/${PN}.1" || die "doman failed"
	insinto /usr/share/mime/packages
	doins "${S}/misc/${PN}.xml"
	doicon "${S}/misc/${PN}.xpm" || die "doicon failed"
	domenu "${S}/misc/${PN}.desktop" || die "domenu failed"
}

plugin_compile() {
	cd "${S}"/TuxGuitar-${1} || die
	eant all
	if [[ -d jni ]]; then
		append-flags $(java-pkg_get-jni-cflags)
		cd jni || die "\"cd jni\" failed"
		CC=$(tc-getCC) emake || die "emake failed"
	fi
}

plugin_install() {
	cd "${S}"/TuxGuitar-${1} || die
	local TUXGUITAR_INST_PATH=/usr/share/${PN}/lib
	local BINARY_NAME=tuxguitar-${1}
	insinto ${TUXGUITAR_INST_PATH}/share/plugins
	doins ${BINARY_NAME}.jar || die "doins ${BINARY_NAME}.jar failed"

	#TuxGuitar has its own classloader. No need to register the plugins.
	if [[ -d jni ]]; then
		java-pkg_doso jni/lib${BINARY_NAME}-jni.so
	fi
}

list_plugins() {
	echo ascii compat converter gtp jsa lilypond midi musicxml ptb tef tray
	echo $(usev alsa) $(usev fluidsynth) $(usev oss) $(usev pdf)
	if use ftp; then
		echo browser-ftp
	fi
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
	if use fluidsynth; then
		ewarn "Fluidsynth plugin blocks behavior of JSA plugin."
		ewarn "Enable only one of them in \"Tools > Plugins\""
	fi
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
