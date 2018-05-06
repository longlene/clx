# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a0195dc1d827b9d6f3377dacfa5c41f201eaa1ee"

DESCRIPTION="S-expression to OpenCL C"
HOMEPAGE="https://github.com/gos-k/oclcl"
SRC_URI="https://github.com/gos-k/oclcl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	virtual/opencl
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/external-program
	dev-lisp/osicat
	dev-lisp/cl-pattern
	dev-lisp/split-sequence
	dev-lisp/cl-reexport
	dev-lisp/cl-ppcre
	dev-lisp/lisp-namespace
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use example || rm -r examples ${PN}-examples.asd
	use test || rm -r t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
