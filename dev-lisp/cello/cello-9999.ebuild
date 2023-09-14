# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="A Cells Inside desktop UI framework rendered by OpenGL"
HOMEPAGE="https://github.com/kennytilton/Cello"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kennytilton/Cello.git"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cells
	dev-lisp/cffi
"
