# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 common-lisp-3

DESCRIPTION="Pure Common Lisp TrueType font renderer for CLX"
HOMEPAGE="https://github.com/filonenko-mikhail/clx-truetype"
SRC_URI=""

EGIT_REPO_URI="https://github.com/filonenko-mikhail/clx-truetype.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clx
	dev-lisp/zpb-ttf
	dev-lisp/cl-vectors
	dev-lisp/cl-paths-ttf
	dev-lisp/cl-aa
	dev-lisp/cl-fad
	dev-lisp/cl-store
	dev-lisp/trivial-features
"

src_compile() {
	:
}
