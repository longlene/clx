# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Numpy like array object for common lisp"
HOMEPAGE="https://github.com/digikar99/dense-arrays"
SRC_URI="https://github.com/digikar99/dense-arrays/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/abstract-arrays
	dev-lisp/polymorphic-functions
	dev-lisp/alexandria
	dev-lisp/compiler-macro-notes
	dev-lisp/closer-mop
	dev-lisp/fiveam
	dev-lisp/iterate
	dev-lisp/trivial-garbage
	dev-lisp/cl-form-types
	dev-lisp/trivial-types
"
BDEPEND=""
