# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="149d550911c761f3414c577ea03866b3c5461984"

DESCRIPTION="Common Lisp C++ JIT for exposing C++ functions"
HOMEPAGE="https://github.com/Islam0mar/CL-CXX-JIT/"
SRC_URI="https://github.com/Islam0mar/CL-CXX-JIT/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-garbage
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
