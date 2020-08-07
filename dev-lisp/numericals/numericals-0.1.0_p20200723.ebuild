# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4f82b74e32b054f65110ee62ba080603c92ac103"

DESCRIPTION="Numerical operations on arrays using SBCL"
HOMEPAGE="https://github.com/digikar99/numericals"
SRC_URI="https://github.com/digikar99/numericals/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/trivial-types
	dev-lisp/introspect-environment
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "numericals\/tests/,$d' ${PN}.asd
		sed -i '/defsystem "numericals+array\/tests/,$d' ${PN}.asd
		rm -r tests tests+array
	fi
}
