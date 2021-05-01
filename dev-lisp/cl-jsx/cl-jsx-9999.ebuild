# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="JSX Compiler for Common Lisp"
HOMEPAGE="https://github.com/thephoeron/cl-jsx"
SRC_URI=""

EGIT_REPO_URI="https://github.com/thephoeron/cl-jsx.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-who
	dev-lisp/parenscript
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}
