# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="FSet, the functional collections library for Common Lisp"
HOMEPAGE="https://github.com/slburson/fset"
SRC_URI="https://github.com/slburson/fset/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-lisp/misc-extensions
	dev-lisp/mt19937
	dev-lisp/named-readtables
	dev-lisp/alexandria
"
