# Copyright 1999-2008 Gentoo Foundation
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
KEYWORDS=""
IUSE="mad mpg123 xosd"

DEPEND=">=virtual/python-2.5
	=dev-python/pysqlite-2*
	mad? (
		dev-python/pymad
		vorbis? ( dev-python/pyvorbis )
		media-libs/libao
	)
	mpg123? ( virtual/mpg123 )
    xosd? ( x11-libs/xosd )"

S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd ${S}
	use mad && python setup.py build_ext -i
}

src_install() {
	distutils_src_install

	rm ${D}/usr/bin/pytone ${D}/usr/bin/pytonectl
	PYTONE_DIR="/usr/lib/python${PYVER}/site-packages/pytone"
	dosym ${PYTONE_DIR}/pytone.py /usr/bin/pytone 
	dosym ${PYTONE_DIR}/pytonectl.py /usr/bin/pytonectl 
	fperms +x ${PYTONE_DIR}/pytone.py ${PYTONE_DIR}/pytonectl.py

	newdoc conf/pytonerc pytonerc.example
}
