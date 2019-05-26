# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a24a8cad2b6dd683fe2280bbc2016cbada3c83bf"

DESCRIPTION="Simple CFFI Foreign Pointer Wrapper for Type Checking"
HOMEPAGE="https://github.com/lispnik/pffft"
SRC_URI="https://github.com/lispnik/pffft/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	test? ( dev-lisp/rt )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd ${PN}-test.lisp
}
