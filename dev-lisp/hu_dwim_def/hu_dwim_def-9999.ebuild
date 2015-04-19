# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="General purpose, homogenous, extensible definer macro"
HOMEPAGE="http://dwim.hu/project/hu.dwim.def"
SRC_URI=""

EGIT_REPO_URI="http://github.com/nixeagle/hu.dwim.def.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora
dev-lisp/iterate
dev-lisp/metabang-bind

dev-lisp/cl-l10n

dev-lisp/contextl

dev-lisp/hu_dwim_common

dev-lisp/hu_dwim_delico

app-emacs/slime

dev-lisp/hu_dwim_wui

dev-lisp/bordeaux-threads
dev-lisp/hu_dwim_util
dev-lisp/trivial-garbage
"
