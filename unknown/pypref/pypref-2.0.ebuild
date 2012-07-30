# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
inherit python games

DESCRIPTION="Preferans card game"
HOMEPAGE="http://pypref.sourceforge.net/"
SRC_URI="mirror://sourceforge/pypref/PyPref-${PV}.tar.gz"
LICENSE="GPL-2"
KEYWORDS="~x86"
IUSE=""
SLOT="0"

S=${WORKDIR}/${PN}

DEPEND="dev-lang/python"

pkg_setup() {
        python_tkinter_exists || die "you must have built python with Tkinter support"
	games_pkg_setup
}
src_unpack(){
	unpack ${A}
	cd ${S}
	sed -i \
	-e "s:game\.:pypref\.:" \
	$(find . -name "*.py") \
	|| die "sed failed"
	
	sed -i -e "s:PATH = '.':PATH = '${GAMES_DATADIR}/${PN}':" \
	-e "s:^CONFIG_FILE = .*:CONFIG_FILE = os.path.expanduser('~') + '/.pypref.cfg':" \
	-e "s:^SAVE_FILE = .*:SAVE_FILE = os.path.expanduser('~') + '/.pypref%s.sav':" \
	pypref.py || die "sed failed"
}
src_compile() {
	einfo "Nothing to compile"
}
src_install() {
	dodoc Readme_en.html Readme_ru.html
	python_version
	dodir /usr/$(get_libdir)/python${PYVER}/site-packages/pypref
	insinto /usr/$(get_libdir)/python${PYVER}/site-packages/pypref
	doins game/*.py

	insinto ${GAMES_DATADIR}/${PN}
	doins -r big

	dogamesbin pypref.py

	make_desktop_entry pypref.py "PyPref"
	
	python_mod_optimize ${D}/usr/$(get_libdir)/python${PYVER}/site-packages/pypref

	prepgamesdirs
}

