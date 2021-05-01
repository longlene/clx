# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Generic layout widget with the same nested thinking as OpenGL"
HOMEPAGE="https://github.com/kennytilton/gui-geometry"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kennytilton/gui-geometry.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cells
"
