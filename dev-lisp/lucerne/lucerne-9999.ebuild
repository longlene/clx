# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A microframework for Common Lisp"
HOMEPAGE="https://gitlab.com/jamesf/lucerne"
SRC_URI=""

EGIT_REPO_URI="https://gitlab.com/jamesf/lucerne.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/clack
dev-lisp/myway
dev-lisp/cl-annot
dev-lisp/trivial-types
dev-lisp/eco
dev-lisp/anaphora
dev-lisp/log4cl
"
