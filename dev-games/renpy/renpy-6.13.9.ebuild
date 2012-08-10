# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"

inherit confutils eutils python versionator games

DESCRIPTION="Visual novel engine written in python"
HOMEPAGE="http://www.renpy.org"
SRC_URI="http://www.renpy.org/dl/${PV}/${P}-source.tar.bz2"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~x86"
IUSE="development doc examples"

RDEPEND="dev-python/argparse
	dev-python/pygame[X]
	>=dev-games/renpy-modules-${PV}"

pkg_setup() {
	confutils_use_depend_any examples development
	python_set_active_version 2
	games_pkg_setup
}

src_prepare() {
	# Fix path to app-editors/jedit
	epatch "${FILESDIR}"/${PN}-jedit-path-6.13.9.patch

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

	local P_SLOT=${PN}-${SLOT}
	newgamesbin "${T}"/${PN}.sh ${P_SLOT} || die

	doins -r common renpy || die

	if use development; then
		doins -r launcher template || die

		newicon launcher/logo32.png ${P}.png || die
		make_desktop_entry ${P_SLOT} "Ren'Py ${PV}" ${P} Game Path="${GAMES_DATADIR}"/${P}
	fi

	if use examples; then
		doins -r the_question || die
		doins -r tutorial || die
	fi

	dodoc doc/_sources/changelog.txt || die

	if use doc; then
		dohtml -r doc || die
	fi

	prepgamesdirs
}

pkg_postinst() {
	python_mod_optimize "${GAMES_DATADIR}/${P}"
	if use development; then
		elog "You need to emerge app-editors/jedit to easily use renpy development interface."
	fi
	games_pkg_postinst
}

pkg_postrm() {
	python_mod_cleanup "${GAMES_DATADIR}/${P}"
}
