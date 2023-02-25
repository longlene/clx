# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e529d7b3a7223ef1bb5c7b9f18384ba67b50b09"

DESCRIPTION="CONSPACK implementation for Common Lisp"
HOMEPAGE="https://github.com/conspack/cl-conspack"
SRC_URI="https://github.com/conspack/cl-conspack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="NewBSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/alexandria
	dev-lisp/ieee-floats
	dev-lisp/trivial-utf8
	dev-lisp/fast-io
	dev-lisp/trivial-garbage
	test? ( dev-lisp/checkl )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
