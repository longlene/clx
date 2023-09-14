# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Game engine with volume graphics written in Common Lisp"
HOMEPAGE="https://github.com/afainer/cleven"
SRC_URI=""

EGIT_REPO_URI="https://github.com/afainer/cleven.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-fad
	dev-lisp/cl-sdl2
"
