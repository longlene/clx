# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Image processing for Matlisp"
HOMEPAGE="https://github.com/matlisp/matlisp-image"
SRC_URI=""

EGIT_REPO_URI="https://github.com/matlisp/matlisp-image.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/matlisp
	dev-lisp/fiveam
	dev-lisp/cl-autowrap
	dev-lisp/trivia
	dev-lisp/trivial-garbage
	dev-lisp/cl-plus-ssl
	dev-lisp/png-read
	dev-lisp/cl-jpeg
	dev-lisp/cl-opengl
"
