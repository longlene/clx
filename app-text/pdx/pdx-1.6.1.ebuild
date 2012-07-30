# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Develops documentation similar to POD or SDF."
HOMEPAGE="http://www.seanet.com/~hgg9140/comp/pdx/doc/index.html"
SRC_URI="http://www.seanet.com/~hgg9140/comp/download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
DEPEND="virtual/python"
RDEPEND="${DEPEND}"

