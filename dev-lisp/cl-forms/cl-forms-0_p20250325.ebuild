# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="680953089c4a4d6201e639ac8188c46656d3f693"

DESCRIPTION="Web forms handling library for Common lisp"
HOMEPAGE="https://github.com/mmontone/cl-forms/"
SRC_URI="https://github.com/mmontone/cl-forms/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/hunchentoot
	dev-lisp/ironclad
	dev-lisp/uuid
	dev-lisp/clavier
	dev-lisp/fmt
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd test
}
	
