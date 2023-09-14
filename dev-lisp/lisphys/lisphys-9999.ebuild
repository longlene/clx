# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A multi bodies systems simulator written in lisp and using automatic differentiation to build equations"
HOMEPAGE="https://github.com/kayhman/lisphys"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kayhman/lisphys.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clunit
	dev-lisp/alexandria
	dev-lisp/cl-opengl
	dev-lisp/lispbuilder-sdl
"
