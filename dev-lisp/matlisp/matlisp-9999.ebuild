# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A base library for scientific computation in Lisp"
HOMEPAGE="https://github.com/matlisp/matlisp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/matlisp/matlisp.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/iterate
dev-lisp/optima
dev-lisp/named-readtables
dev-lisp/lambda-reader
dev-lisp/cl-yacc
dev-lisp/trivial-garbage
"
