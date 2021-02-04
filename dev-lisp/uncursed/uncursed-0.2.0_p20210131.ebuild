# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6f0fe1fcf00df1e36d2cab89e9f840e480ac9d9a"

DESCRIPTION="A blessed fixed greased +3 terminal library"
HOMEPAGE="https://github.com/Plisp/uncursed"
SRC_URI="https://github.com/Plisp/uncursed/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/terminfo
	dev-lisp/cl-setlocale
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-examples.asd examples
}
