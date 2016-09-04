# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Pure math functions useful for games, 3D, and GL in general"
HOMEPAGE="https://github.com/lispgames/mathkit"
SRC_URI=""

EGIT_REPO_URI="https://github.com/lispgames/mathkit.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/sb-cga
"
