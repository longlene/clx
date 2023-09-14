# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f24697a5f507bf63431fbb33e372574c87b1193a"

DESCRIPTION="Build system in Common Lisp"
HOMEPAGE="https://github.com/ruricolist/overlord"
SRC_URI="https://github.com/ruricolist/overlord/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fset
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/trivial-file-size
	dev-lisp/babel
	dev-lisp/bit-smasher
	dev-lisp/local-time
	dev-lisp/trivia
	dev-lisp/lparallel
	dev-lisp/named-readtables
	dev-lisp/cl-strftime
	dev-lisp/drakma
	dev-lisp/cl-ppcre
	dev-lisp/bordeaux-threads
	dev-lisp/shlex
"
BDEPEND=""

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
