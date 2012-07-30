# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils eutils

MY_PN="PyTone"
MY_P="${MY_PN}-${PV}"
DESCRIPTION="PyTone is a music jukebox written in Python with a curses based GUI."
HOMEPAGE="http://www.luga.de/pytone/"
SRC_URI="http://www.luga.de/pytone/download/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="mad xmms xosd"

DEPEND=">=virtual/python-2.3
	sys-libs/ncurses
	mad? (
	  dev-python/pymad
	  dev-python/pyvorbis
	  media-libs/libao
	)
	xmms? (
	  media-sound/xmms
	  dev-python/pyxmms
	)
    xosd? ( x11-libs/xosd )
"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${PV}-byteorder.patch
	python setup.py build_ext -i
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}

pkg_postinst() {
	distutils_python_version
	PYTHON_DIR="/usr/lib/python${PYVER}"

	if [[ -e ${ROOT}usr/bin/pytone ]]; then
		sed -i -e \
		"s#src/pytone.py#${PYTHON_DIR}/site-packages/pytone/pytone.py#" \
		${ROOT}usr/bin/pytone \
		|| or die "sed failed with ${ROOT}usr/bin/pytone"
	fi
	if [[ -e ${ROOT}usr/bin/pytonectl ]]; then
		sed -i -e \
		"s#src/pytonectl.py#${PYTHON_DIR}/site-packages/pytone/pytonectl.py#" \
		${ROOT}usr/bin/pytonectl \
		|| or die "sed failed with ${ROOT}usr/bin/pytonectl"
	fi

	einfo ""
	einfo "Configuration"
	einfo "-------------"
	einfo "Side-wide configuration goes into /etc/pytonerc - while most of"
	einfo "the standard settings will probably fit your needs, you have to"
	einfo "change the variable musicbasedir in the section [database.main]"
	einfo "of the main database, which specifies the root of your primary"
	einfo "MP3 collection."
	einfo ""
	einfo "Usage"
	einfo "-----"
	einfo "After having adjusted the basic configuration variables to your"
	einfo "personal needs, just start the program with 'pytone' and look"
	einfo "how the database is being rebuilt."
	einfo "For more information, please use 'pytone --help'"
	einfo "and read the documentation."
	einfo ""
}

pkg_postrm() {
	einfo ""
	einfo "After unmerging this package, you can safely delete"
	einfo "the directory \${HOME}/.pytone"
	einfo "ATTENTION!!! Don't do that after an update!!!"
	einfo ""
}
