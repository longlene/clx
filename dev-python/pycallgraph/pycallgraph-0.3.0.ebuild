# Copyright 2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Python call graph library."
SRC_URI="http://pycallgraph.slowchop.com/files/download/${P}.tar.gz"
HOMEPAGE="http://pycallgraph.slowchop.com/"
LICENSE="GPL-2"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/python-2.4"
RDEPEND="${DEPEND}
         media-gfx/graphviz"
