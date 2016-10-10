# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An HTTP-handler declaration mini-language aiming for cross-server compatibility"
HOMEPAGE="https://github.com/Inaimathi/cl-handlers"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Inaimathi/cl-handlers.git"

LICENSE="Expat"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	test? ( dev-lisp/prove )
"
