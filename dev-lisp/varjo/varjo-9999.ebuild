# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Lisp to GLSL Language Translator"
HOMEPAGE="https://github.com/cbaggers/varjo"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/varjo.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/split-sequence
dev-lisp/alexandria
dev-lisp/named-readtables
dev-lisp/vas-string-metrics
"
