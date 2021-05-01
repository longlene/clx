# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A code walker that parses a Common Lisp sexp into an AST"
HOMEPAGE="http://dwim.hu/project/hu.dwim.walker"
SRC_URI=""

EGIT_REPO_URI="https://github.com/nixeagle/cl-walker.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora
dev-lisp/contextl
dev-lisp/closer-mop
dev-lisp/hu_dwim_common-lisp
dev-lisp/hu_dwim_def+contextl
dev-lisp/hu_dwim_defclass-star+hu_dwim_def
dev-lisp/nisp_dwim_handle-otherise
dev-lisp/metabang-bind
dev-lisp/hu_dwim_wui
"
