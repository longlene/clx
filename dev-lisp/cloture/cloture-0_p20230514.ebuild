# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0d01e93a849c923413ccba806b10dc8d538fb86c"

DESCRIPTION="Clojure in Common Lisp"
HOMEPAGE="https://github.com/ruricolist/cloture"
SRC_URI="https://github.com/ruricolist/cloture/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/serapeum
	dev-lisp/trivia
	dev-lisp/cl-arrows
	dev-lisp/fset
	dev-lisp/named-readtables
	dev-lisp/fare-utils
	dev-lisp/cl-murmurhash
	dev-lisp/lisp-namespace
	dev-lisp/cl-ppcre
	dev-lisp/fiveam
	dev-lisp/closer-mop
	dev-lisp/cl-custom-hash-table
	dev-lisp/stmx
	dev-lisp/atomics
	dev-lisp/lparallel
	dev-lisp/overlord
	dev-lisp/global-vars
	dev-lisp/esrap
	dev-lisp/iterate
	dev-lisp/sycamore
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all core-syms.txt pprint-syms.txt
}
