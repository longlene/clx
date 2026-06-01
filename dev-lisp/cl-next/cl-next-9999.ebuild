# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A library to support Modern Common Lisp style"
HOMEPAGE="https://github.com/thezerobit/cl-next"

EGIT_REPO_URI="https://github.com/thezerobit/cl-next.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
dev-lisp/named-readtables
"
