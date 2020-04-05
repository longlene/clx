# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fc8473bc6f929696b03b43820596b7c976c4678e"

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
