# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Yet Another Portable Library for Process Handling / Subshell Invokation"
HOMEPAGE="https://github.com/guicho271828/eazy-process"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/eazy-process.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t testscr.lisp
}
