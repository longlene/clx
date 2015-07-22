# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="An object-oriented language for parsing and pattern matching"
HOMEPAGE="https://github.com/cdglabs/ohm"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/util-extend
dev-nodejs/is-buffer
dev-nodejs/inherits
dev-nodejs/es6-symbol
"
