# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Python-like generators for Common Lisp"
HOMEPAGE="https://github.com/BnMcGn/snakes"
SRC_URI=""
EGIT_REPO_URI="https://github.com/BnMcGn/snakes.git"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-cont
dev-lisp/closer-mop
dev-lisp/fiveam
dev-lisp/iterate
dev-lisp/cl-utilities
"
