# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Numpy clone in Common Lisp"
HOMEPAGE="https://github.com/numcl/numcl"
SRC_URI="https://github.com/numcl/numcl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/type-r
	dev-lisp/constantfold
	dev-lisp/lisp-namespace
	dev-lisp/cl-randist
	dev-lisp/float-features
	dev-lisp/function-cache
	dev-lisp/specialized-function
	dev-lisp/gtype
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
	use test || rm -r numcl.test.asd t
}
