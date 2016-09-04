# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A toolbox for making games"
HOMEPAGE="https://github.com/mfiano/gamebox"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mfiano/gamebox.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/local-time
	dev-lisp/sdl2kit
	dev-lisp/glkit
	dev-lisp/defpackage-plus
	dev-lisp/cl-tga
	dev-lisp/png-read
	dev-lisp/graph
	dev-lisp/cl-speedy-queue
	dev-lisp/cl-variates
"
