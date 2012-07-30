# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="SIVP toolbox for Scilab"
HOMEPAGE="http://sivp.sourceforge.net/"
SRC_URI="http://mesh.dl.sourceforge.net/sourceforge/sivp/sivp-0.4.3.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE="xsl xml"

DEPEND=">=sci-mathematics/scilab-3.1 >=sci-libs/opencv-0.9.6"
RDEPEND=""

src_compile(){
				cd ${S}
				econf --prefix=/usr/share  --disable-fast-install
				cd ${S}
				cat Makefile | sed -e "s/\/bin\/scilab/\/usr\/bin\/scilab/g" > Makefile
				cat src/Makefile | sed -e "s/\/bin\/scilab/\/usr\/bin\/scilab/g" > src/Makefile
				emake
}

