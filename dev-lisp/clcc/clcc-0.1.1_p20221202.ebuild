# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f2a96cf5c73469b1c4bcf7830d4faf6d4b03fdaa"

DESCRIPTION="C++ language model and compiler in Common Lisp"
HOMEPAGE="https://github.com/joergen7/clcc"
SRC_URI="https://github.com/joergen7/clcc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/lang-util
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :clcc\/test/,$d' \
		-i ${PN}.asd
	rm -rf test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
