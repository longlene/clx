# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A color data type for Common Lisp"
HOMEPAGE="https://github.com/ralph-schleicher/rs-colors"
SRC_URI=""

EGIT_REPO_URI="https://github.com/ralph-schleicher/rs-colors.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/read-number
"
