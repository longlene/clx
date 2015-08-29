# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="detect and report syntax errors in source code strings"
HOMEPAGE="https://github.com/substack/node-syntax-error"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-nodejs/acorn"
RDEPEND="${DEPEND}"
