# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp interface to React.js"
HOMEPAGE="https://github.com/thephoeron/cl-react"
SRC_URI=""

EGIT_REPO_URI="https://github.com/thephoeron/cl-react.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-jsx
	dev-lisp/cl-who
	dev-lisp/cl-css
	dev-lisp/parenscript
"

src_prepare() {
	use test || rm -r ${PN}-test.asd t
}
