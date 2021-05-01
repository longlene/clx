# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d6dd0e3494103348ed5581fcde00997bba7e0980"

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
