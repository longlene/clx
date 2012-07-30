# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="A utility to speed repeated runs of the same python program"
HOMEPAGE="http://readyexec.sourceforge.net/"
SRC_URI="mirror://sourceforge/readyexec/${P}.tar.bz2"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~sparc ~ppc"
IUSE=""

DEPEND="virtual/python"

src_install () {
	mydoc="INSTALL NEWS PKG-INFO THANKS"
	mv readyexec.py readyexec.py.tmp
	echo '#!/usr/bin/env python' > readyexec.py
	cat readyexec.py.tmp >> readyexec.py
	rm readyexec.py.tmp
	distutils_src_install
	distutils_python_version
	dobin /usr/lib/python${PYVER}/site-packages/readyexec.py
}
