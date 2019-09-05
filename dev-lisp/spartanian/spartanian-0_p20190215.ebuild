# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dacd36bb3282ab224be9e53848eb778507667d45"

DESCRIPTION="A implementation of Sparse Tensor in Common Lisp"
HOMEPAGE="https://github.com/masatoi/spartanian"
SRC_URI="https://github.com/masatoi/spartanian/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests
}
