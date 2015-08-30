# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Exploratory programming environment and documentation generator"
HOMEPAGE="https://github.com/melisgl/mgl-pax"
SRC_URI=""

EGIT_REPO_URI="https://github.com/melisgl/mgl-pax.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/3bmd
dev-lisp/3bmd-ext-code-blocks
dev-lisp/alexandria
dev-lisp/babel
dev-lisp/cl-fad
dev-lisp/colorize
dev-lisp/ironclad
dev-lisp/named-readtables
dev-lisp/pythonic-string-reader
app-emacs/slime
"
