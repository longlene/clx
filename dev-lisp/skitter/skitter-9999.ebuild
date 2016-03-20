# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A small event system for games"
HOMEPAGE="https://github.com/cbaggers/skitter"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cbaggers/skitter.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/rtg-math
	dev-lisp/structy-defclass
"
