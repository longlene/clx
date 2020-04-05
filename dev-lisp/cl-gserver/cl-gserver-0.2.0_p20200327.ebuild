# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4f42b14a84c7a6de9e958a5b7fe6f65b0b4ef967"

DESCRIPTION="Erlang GenServer inspired library for common lisp based on lparallel"
HOMEPAGE="https://github.com/mdbergmann/cl-gserver/"
SRC_URI="https://github.com/mdbergmann/cl-gserver/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lparallel
	dev-lisp/log4cl
	dev-lisp/iterate
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
