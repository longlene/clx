# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="ECMAScript 6 Iterator interface"
HOMEPAGE="https://github.com/medikoo/es6-iterator"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/d
dev-nodejs/es6-symbol
dev-nodejs/es5-ext
"
