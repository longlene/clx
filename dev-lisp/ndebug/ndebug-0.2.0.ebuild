# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A toolkit to construct interface-aware yet standard-compliant debugger hooks"
HOMEPAGE="https://github.com/atlas-engineer/ndebug"
SRC_URI="https://github.com/atlas-engineer/ndebug/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/dissect
	dev-lisp/trivial-custom-debugger
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-gray-streams
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem "ndebug\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}

