# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9be10d5e9336aa1f3df8aa6dd7e97abd7d2c5429"

DESCRIPTION="Basic Clojure affordances for Common Lisp"
HOMEPAGE="https://github.com/inaimathi/clj"
SRC_URI="https://github.com/inaimathi/clj/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/named-readtables
	dev-lisp/cl-hamt
	dev-lisp/optima
	dev-lisp/arrow-macros
	dev-lisp/test-utils
	dev-lisp/local-package-aliases
	dev-lisp/agnostic-lizard
"
BDEPEND=""
