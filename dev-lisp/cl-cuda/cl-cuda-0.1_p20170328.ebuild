# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="da575f2f747ba87334db868dea2da5ee4f5b8dc3"

DESCRIPTION="Cl-cuda is a library to use NVIDIA CUDA in Common Lisp programs"
HOMEPAGE="https://github.com/takagi/cl-cuda"
SRC_URI="https://github.com/takagi/cl-cuda/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/external-program
	dev-lisp/osicat
	dev-lisp/cl-pattern
	dev-lisp/split-sequence
	dev-lisp/cl-reexport
	dev-lisp/cl-ppcre
	dev-lisp/local-time
	dev-lisp/cl-emb
	dev-lisp/cl-opengl
	example? ( dev-lisp/imago )
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd ${PN}-interop-test.asd t
	use example || rm -rf ${PN}-examples.asd ${PN}-interop-example.asd examples
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
