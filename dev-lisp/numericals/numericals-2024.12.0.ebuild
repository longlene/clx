# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Numerical operations on arrays using SBCL"
HOMEPAGE="https://github.com/digikar99/numericals"
SRC_URI="https://github.com/digikar99/numericals/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/peltadot
	dev-lisp/peltadot-traits-library
	dev-lisp/iterate
	dev-lisp/policy-cond
	dev-lisp/bmas
	dev-lisp/lparallel
	dev-lisp/ceigen-lite
	dev-lisp/magicl
	test? (
		dev-lisp/cl-ascii-table
		dev-lisp/py4cl2
		dev-lisp/fiveam
		dev-lisp/jsown-utils
	)

"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -e '/defsystem "numericals\/benchmarks/,$d' \
			-i ${PN}.asd
		rm -r benchmarks
	fi
}
