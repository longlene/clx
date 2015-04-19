# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Random variates for Common Lisp"
HOMEPAGE="https://github.com/tpapp/cl-random"
SRC_URI=""

EGIT_REPO_URI="https://github.com/tpapp/cl-random.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/anaphora
dev-lisp/array-operations
dev-lisp/cl-num-utils
dev-lisp/cl-rmath
dev-lisp/cl-slice
dev-lisp/gsll
dev-lisp/let-plus
dev-lisp/lla
"
