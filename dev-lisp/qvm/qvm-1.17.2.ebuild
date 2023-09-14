# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="The high-performance and featureful Quil simulator"
HOMEPAGE="https://github.com/quil-lang/qvm"
SRC_URI="https://github.com/quil-lang/qvm/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/abstract-classes
	dev-lisp/ieee-floats
	dev-lisp/lparallel
	>=dev-lisp/magicl-0.6.1
	dev-lisp/trivial-garbage
	dev-lisp/global-vars
	dev-lisp/cffi
	>=dev-lisp/static-vectors-1.8.3
	>=dev-lisp/cl-quil-1.7.0
	dev-lisp/mt19937
	dev-lisp/trivial-features
	test? ( dev-lisp/fiasco )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd tests ${PN}-examples.asd examples ${PN}-benchmarks.asd bench ${PN}-app.asd app ${PN}-app-tests.asd 
}
