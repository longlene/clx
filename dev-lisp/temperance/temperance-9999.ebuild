# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A logic programming library for Common Lisp"
HOMEPAGE="https://github.com/sjl/temperance"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sjl/temperance.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-arrows
	dev-lisp/policy-cond
	dev-lisp/lam
"

src_compile() {
	:
}
