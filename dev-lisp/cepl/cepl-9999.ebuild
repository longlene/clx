# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Code Evaluate Play Loop"
HOMEPAGE="https://github.com/cbaggers/cepl"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/cepl.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
app-emacs/slime
dev-lisp/cl-autowrap
dev-lisp/cl-plus-c
dev-lisp/cl-fad
dev-lisp/cl-opengl
dev-lisp/varjo
dev-lisp/temporal-functions
dev-lisp/cl-utilities
dev-lisp/cl-ppcre
dev-lisp/symbol-munger
dev-lisp/named-readtables
dev-lisp/cl-sdl2
dev-lisp/cl-devil
dev-lisp/classimp
"
