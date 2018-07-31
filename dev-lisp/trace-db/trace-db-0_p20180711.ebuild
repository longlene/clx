# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="64006cbc9ee701cdda4dcc0e2923d78695983de6"

DESCRIPTION="Writing, reading, storing, and searching of program traces"
HOMEPAGE="https://github.com/GrammaTech/trace-db"
SRC_URI="https://github.com/GrammaTech/trace-db/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/boost
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/iterate
	dev-lisp/arrow-macros
	dev-lisp/cl-store
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/named-readtables
	dev-lisp/curry-compose-reader-macros
"

src_prepare() {
	eapply_user
	sed -i 's#/usr/local/#/usr/#g' Makefile
}

src_install() {
	#dolib.so libtrace-db.so
	common-lisp-3_src_install
	common-lisp-install-sources -t all *.h *.cpp Makefile
	dodoc README.md
}
