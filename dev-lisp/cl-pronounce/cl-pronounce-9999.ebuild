# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An english number pronounciation service"
HOMEPAGE="https://github.com/inaimathi/cl-pronounce"
SRC_URI=""

EGIT_REPO_URI="https://github.com/inaimathi/cl-pronounce.git"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-handlers
	dev-lisp/woo
	dev-lisp/alexandria
	dev-lisp/cl-who
	dev-lisp/parenscript
"
