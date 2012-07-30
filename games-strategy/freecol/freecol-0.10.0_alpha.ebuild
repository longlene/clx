# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-strategy/freecol/freecol-0.8.4.ebuild,v 1.2 2009/10/25 12:20:32 maekke Exp $

EAPI=2
WANT_ANT_TASKS="ant-nodeps"
inherit eutils java-pkg-2 java-ant-2 games

MY_P=${P/_/-}
DESCRIPTION="An open source clone of the game Colonization"
HOMEPAGE="http://www.freecol.org/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND="${RDEPEND}
	test? (
		dev-java/ant-junit
		dev-java/ant-trax
	)
	dev-java/commons-cli:1
	dev-java/miglayout
	>=dev-java/cortado-0.6
	>=virtual/jdk-1.6"
RDEPEND="${RDEPEND}
	>=virtual/jre-1.6"

S=${WORKDIR}/${PN}

pkg_setup() {
	games_pkg_setup
	java-pkg-2_pkg_setup
}

src_prepare() {
	local cp=""

	rm -fv $(find . -name '*.jar')
	java-pkg_jar-from --into jars miglayout
	java-pkg_jar-from --into jars commons-cli-1
	java-pkg_jar-from --into jars cortado
	cp="${cp} $(java-pkg_getjars miglayout)"
	cp="${cp} $(java-pkg_getjars commons-cli-1)"
	cp="${cp} $(java-pkg_getjars cortado)"
	sed -i \
		-e "/Class-Path/s:jars/.*\":${cp}\":" \
		build.xml \
		|| die "sed failed"
}

JAVA_ANT_REWRITE_CLASSPATH="true"
EANT_GENTOO_CLASSPATH="commons-cli-1,miglayout,cortado"

src_compile() {
	eant
}

src_test() {
	java-pkg_jar-from --into test/lib junit
	ANT_TASKS="ant-junit ant-trax ant-nodeps" eant testall
}

src_install () {
	java-pkg_jarinto "${GAMES_DATADIR}"/${PN}
	java-pkg_dojar FreeCol.jar
	java-pkg_dolauncher ${PN} \
		-into "${GAMES_PREFIX}" \
		--pwd "${GAMES_DATADIR}"/${PN} \
		--java_args -Xmx512M
	insinto "${GAMES_DATADIR}"/${PN}
	doins -r data || die "doins failed"
	doicon ${PN}.xpm
	make_desktop_entry ${PN} FreeCol
	dodoc README
	prepgamesdirs
}
