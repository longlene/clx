# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"

inherit python versionator games

DESCRIPTION="Visual novel engine written in python"
HOMEPAGE="http://www.renpy.org"
SRC_URI="http://www.renpy.org/dl/${PV}/${P}-source.tar.bz2"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pygame[X]
	>=dev-games/renpy-modules-${PV}"

pkg_setup() {
	python_set_active_version 2
	games_pkg_setup
}

src_prepare() {
	find renpy -name '*.pyo' -exec rm -f {} + || die
	python_convert_shebangs 2 renpy.py

	sed -e "s:GAMES_DATADIR:${GAMES_DATADIR}:g" \
		-e "s:PACKAGE:${P}:g" \
		"${FILESDIR}"/${PN}.sh > "${T}"/${PN}.sh || die
}

src_install() {
	insinto "${GAMES_DATADIR}"/${P}
	exeinto "${GAMES_DATADIR}"/${P}

	doexe renpy.py || die

	newgamesbin "${T}"/${PN}.sh ${PN}-${SLOT}|| die

	doins -r common renpy || die
	dodoc CHANGELOG.txt || die

	prepgamesdirs
}

pkg_postinst() {
	python_mod_optimize "${GAMES_DATADIR}/${P}"
	games_pkg_postinst
}

pkg_postrm() {
	python_mod_cleanup "${GAMES_DATADIR}/${P}"
}
