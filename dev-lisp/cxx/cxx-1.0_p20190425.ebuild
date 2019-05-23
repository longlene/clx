# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="990c2f0b010db7beb158e2aa7596c7be48a8f657"

DESCRIPTION="Common Lisp and CXX interoperation"
HOMEPAGE="https://github.com/Islam0mar/cl-cxx"
SRC_URI="https://github.com/Islam0mar/cl-cxx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/clcxx
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r cxx-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
