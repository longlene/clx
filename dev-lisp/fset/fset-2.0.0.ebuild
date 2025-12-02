# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="FSet, the functional collections library for Common Lisp"
HOMEPAGE="https://github.com/slburson/fset"
SRC_URI="https://github.com/slburson/fset/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/misc-extensions
	dev-lisp/mt19937
"
