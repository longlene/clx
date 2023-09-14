# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2f68d45a04a8f1d6776a85abefa5f1b3d1ad4665"

DESCRIPTION="One-shot solution to the CL library documentation generator"
HOMEPAGE="https://github.com/guicho271828/eazy-documentation"
SRC_URI="https://github.com/guicho271828/eazy-documentation/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/cl-ppcre
	dev-lisp/common-doc
	dev-lisp/common-html
	dev-lisp/cl-who
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
}
