# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d333fa917f33eb32fa310e059131f2dbdef4144a"

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
	dev-lisp/optima
	dev-lisp/iolib
	dev-lisp/trivial-garbage
	dev-lisp/cl-ppcre
	dev-lisp/cl-rlimit
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t testscr.lisp
}
