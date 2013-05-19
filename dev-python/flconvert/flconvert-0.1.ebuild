# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/flconvert/flconvert-0.1.ebuild,v 1.1 2006/08/18 11:26:30 marienz Exp $

inherit distutils

MY_P=${P}a2
S=${WORKDIR}/${MY_P}

DESCRIPTION="A transcripter that allows you to pass from fluid code to python code (pyFltk)"
HOMEPAGE="http://pyfltk.sourceforge.net/"
SRC_URI="mirror://sourceforge/pyfltk/${MY_P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86"

RDEPEND="dev-lang/python
	>=dev-python/pyFltk-1.1.1-r1"

src_install() {
        distutils_src_install
}

