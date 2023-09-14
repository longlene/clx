# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9ee0bdebcd2bb9b242671a75460db13fbf45454c"

DESCRIPTION="Portability layer for atomic operations like compare-and-swap (CAS)"
HOMEPAGE="https://github.com/Shinmera/atomics"
SRC_URI="https://github.com/Shinmera/atomics/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests.lisp
}
