# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="a Common Lisp Framework for Finite Element Methods"
HOMEPAGE="http://www.femlisp.org"
SRC_URI=""

EGIT_REPO_URI="git://git.savannah.nongnu.org/femlisp.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/closer-mop
	dev-lisp/fiveam
	dev-lisp/infix
	dev-lisp/cl-ppcre
	dev-lisp/cl-gd
	dev-lisp/mesh
	dev-lisp/bordeaux-threads
	dev-lisp/lparallel
	sci-visualization/opendx
"

