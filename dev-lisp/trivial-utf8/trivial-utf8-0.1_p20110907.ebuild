# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ba9b4ff11396a26dd7455ebfd426c07d7036e6be"

DESCRIPTION="A small library for doing UTF-8-based input and output."
HOMEPAGE="http://common-lisp.net/project/trivial-utf-8/"
SRC_URI="https://github.com/fukamachi/trivial-utf-8/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

src_prepare() {
	default
	sed -e '/defsystem :trivial-utf-8-tests/,$d' \
		-i trivial-utf-8.asd
	rm tests.lisp
}

src_install() {
	common-lisp-3_src_install
	dodoc -r doc/*
}
