# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f376eca03156785742aa5e90c4417dec1113d6fd"

DESCRIPTION="A dialect of ML embedded in Common Lisp"
HOMEPAGE="https://github.com/stylewarning/coalton"
SRC_URI="https://github.com/stylewarning/coalton/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/global-vars
	dev-lisp/trivial-garbage
	dev-lisp/optima
	dev-lisp/abstract-classes
	dev-lisp/singleton-classes
	test? ( dev-lisp/fiasco )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:coalton\/tests/,$d' ${PN}.asd
		rm package.lisp
	fi
}
