# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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
	dev-lisp/polymorphic-functions
	dev-lisp/cl-form-types
	dev-lisp/compiler-macro-notes
	dev-lisp/ctype
	dev-lisp/bmas
	dev-lisp/magicl
	dev-lisp/fiveam
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/cffi
	dev-lisp/lparallel
	dev-lisp/policy-cond
	dev-lisp/specialized-function
	app-emacs/slime
	dev-lisp/trivial-coerce
	dev-lisp/trivial-types
	dev-lisp/trivial-package-local-nicknames
	dev-lisp/introspect-environment
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "numericals\/benchmarks/,$d' ${PN}.asd
		rm -r tests tests+array
	fi
}
