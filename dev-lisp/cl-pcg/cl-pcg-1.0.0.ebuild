# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Permuted congruential generators in Common Lisp"
HOMEPAGE="https://github.com/sjl/cl-pcg"
SRC_URI="https://github.com/sjl/cl-pcg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/1am )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}.test.asd test
}

src_compile() {
	:
}
