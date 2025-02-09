# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ad9ca84be21a1232626887b452bcda52c58d17a2"

DESCRIPTION="A reader-macro for debug print"
HOMEPAGE="https://github.com/masatoi/cl-debug-print"
SRC_URI="https://github.com/masatoi/cl-debug-print/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if use !test; then
		rm -rf ${PN}-test.asd tests
	fi
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
