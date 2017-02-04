# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils common-lisp-3 vcs-snapshot

EGIT_COMMIT="cc25d9f54c736e48a6644b1df5689866c36103c2"

DESCRIPTION="Fortran ABI independent wrappers around scal, dot"
HOMEPAGE="https://github.com/matlisp/matlisp-forbi"
SRC_URI="https://github.com/matlisp/matlisp-forbi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	virtual/fortran
"
RDEPEND="${DEPEND}
	dev-lisp/matlisp
"

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	dolib.so libmatlisp.so
	common-lisp-3_src_install
}
