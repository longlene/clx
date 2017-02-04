# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ab010bac5172fc8ea4af3489403131a9104d9896"

DESCRIPTION="Common Lisp binding for OpenCL API"
HOMEPAGE="https://github.com/gos-k/cl-oclapi"
SRC_URI="https://github.com/gos-k/cl-oclapi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-annot
	dev-lisp/cl-reexport
	virtual/opencl
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}-test.asd
}
