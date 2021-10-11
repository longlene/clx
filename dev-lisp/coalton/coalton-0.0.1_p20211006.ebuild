# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="029ab6c4f3f5f4280e5f6986635581d4ea256d2b"

DESCRIPTION="A dialect of ML embedded in Common Lisp"
HOMEPAGE="https://github.com/coalton-lang/coalton"
SRC_URI="https://github.com/coalton-lang/coalton/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/global-vars
	dev-lisp/trivia
	dev-lisp/serapeum
	dev-lisp/fset
	dev-lisp/float-features
	test? ( dev-lisp/fiasco )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:coalton\/tests/,$d' ${PN}.asd
		rm -rf tests
	fi
}
