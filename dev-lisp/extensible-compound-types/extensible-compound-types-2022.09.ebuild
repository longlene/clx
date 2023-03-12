# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="User defined compound types in Common Lisp"
HOMEPAGE="https://github.com/digikar99/extensible-compound-types"
SRC_URI="https://github.com/digikar99/extensible-compound-types/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-environments
	dev-lisp/compiler-macro-notes
	dev-lisp/fiveam
	dev-lisp/in-nomine
	dev-lisp/introspect-environment
	dev-lisp/optima
	dev-lisp/trivial-types
"
BDEPEND=""
