# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Wrapper layer for POSIX pthread on common lisp"
HOMEPAGE="https://github.com/guicho271828/cl-pthread"

EGIT_REPO_URI="https://github.com/guicho271828/cl-pthread.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iolib
dev-lisp/alexandria
dev-lisp/iterate
"
src_install() {
	common-lisp-install-sources -t all src
	common-lisp-install-asdf ${PN}.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}.test.asd
	fi
}
