# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e605e58de3b664d42ea51fbc628d7d438eb2e711"

DESCRIPTION="Image processing for Matlisp"
HOMEPAGE="https://github.com/matlisp/matlisp-image"
SRC_URI="https://github.com/matlisp/matlisp-image/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/matlisp
	dev-lisp/fiveam
	dev-lisp/cl-autowrap
	dev-lisp/trivia
	dev-lisp/trivial-garbage
	dev-lisp/png-read
	dev-lisp/cl-jpeg
	dev-lisp/cl-opengl
"
