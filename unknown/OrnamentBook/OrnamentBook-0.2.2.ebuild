# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="python gtk book reader for plain text and fb2 books which simulates real book"
HOMEPAGE="http://sourceforge.net/projects/pybookreader/"
LICENSE="GPL-2"
KEYWORDS="~x86"
SRC_URI="mirror://sourceforge/pybookreader/${P}.tar.gz"

DEPEND="virtual/python
		 >=dev-python/pygtk-2.2
		 dev-libs/libxml2"
RDEPEND="${DEPEND}"

