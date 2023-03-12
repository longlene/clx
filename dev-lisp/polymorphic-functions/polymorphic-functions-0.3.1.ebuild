# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Type based dispatch for Common Lisp"
HOMEPAGE=""
SRC_URI="https://github.com/digikar99/polymorphic-functions/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/compiler-macro-notes
	dev-lisp/extensible-compound-types
	dev-lisp/fiveam
	dev-lisp/cl-form-types
	dev-lisp/ctype
	dev-lisp/introspect-environment
	dev-lisp/let-plus
	dev-lisp/optima
	dev-lisp/split-sequence
	dev-lisp/trivial-garbage
"
BDEPEND=""
