# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1a7013b9824b36c6d6b10b912e69d20b963f7280"

DESCRIPTION="Yet Another Portable Library for Process Handling / Subshell Invokation"
HOMEPAGE="https://github.com/guicho271828/eazy-process"
SRC_URI="https://github.com/guicho271828/eazy-process/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivia
	dev-lisp/iolib
	dev-lisp/trivial-garbage
	dev-lisp/cl-ppcre
	dev-lisp/cl-rlimit
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm -rf ${PN}.test.asd t testscr.lisp
}
