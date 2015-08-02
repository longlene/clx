# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Node.js interface to the GraphViz graphing tool"
HOMEPAGE="https://github.com/glejeune/node-graphviz"
#SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/temp
"
