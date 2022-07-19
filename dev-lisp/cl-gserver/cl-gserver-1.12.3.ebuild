# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Erlang GenServer inspired library for common lisp based on lparallel"
HOMEPAGE="https://github.com/mdbergmann/cl-gserver/"
SRC_URI="https://github.com/mdbergmann/cl-gserver/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
	dev-lisp/cl-speedy-queue
	dev-lisp/log4cl
	dev-lisp/str
	dev-lisp/blackbird
	dev-lisp/binding-arrows
	dev-lisp/atomics
	test? ( dev-lisp/fiveam dev-lisp/trivia )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem "cl-gserver\/tests/,$d' ${PN}.asd
		rm -r tests
	fi
}
