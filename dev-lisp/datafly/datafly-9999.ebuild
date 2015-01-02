# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A lightweight database library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/datafly"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/datafly.git"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/iterate
dev-lisp/optima
dev-lisp/trivial-types
dev-lisp/closer-mop
dev-lisp/cl-syntax
dev-lisp/sxql
dev-lisp/cl-dbi
dev-lisp/alexandria
dev-lisp/babel
dev-lisp/local-time
dev-lisp/function-cache
dev-lisp/cl-json
dev-lisp/log4cl"
