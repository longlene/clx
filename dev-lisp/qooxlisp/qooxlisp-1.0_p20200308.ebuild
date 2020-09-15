# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3d71517a5aba039824d06a559e500d0b96bb4391"

DESCRIPTION="The Last Web App Framework You Will Ever Evaluate: qooxdoo, Lisp, and Cells"
HOMEPAGE="https://github.com/kennytilton/qooxlisp"
SRC_URI="https://github.com/kennytilton/qooxlisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/utils-kt
	dev-lisp/cells
	dev-lisp/cl-json
"

src_prepare() {
	default
	rm -rf cl-json_0.4.0 apropos ide
}
