# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="ECMAScript code generator"
HOMEPAGE="https://github.com/estools/escodegen"
#SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/source-map
dev-nodejs/optionator
dev-nodejs/esprima
dev-nodejs/esutils
dev-nodejs/estraverse
"
