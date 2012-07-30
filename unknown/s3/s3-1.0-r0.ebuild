# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="S3 is an X Windows software package for the interactive \
exploration of 'particle systems' on one and two dimensional grids with  \
at most eight states at each site. It offers a number of built-in models \
which can be simulated from a variety of initializations."
HOMEPAGE="http://http://web.syr.edu/~jtcox/s3/index.html/"
SRC_URI="http://web.syr.edu/~jtcox/s3/s3.tar.Z"
LICENSE="Unknown"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="app-shells/tcsh
        X? ( virtual/x11 )"

S=${WORKDIR}/s3

src_compile() {
	export OPENWINHOME="/usr/X11R6"
	sed -i -e 's/XPREFIX=$(OPENWINHOME)/XPREFIX=\/usr/' Makefile || die
	emake || die
}

src_install() {
	dobin s3 || die
	dobin s3s || die
}

