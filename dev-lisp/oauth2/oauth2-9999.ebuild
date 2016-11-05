# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="OAuth2 library for Common Lisp"
HOMEPAGE="https://github.com/Neronus/oauth2"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Neronus/oauth2.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/drakma
	dev-lisp/cl-json
	dev-lisp/alexandria
"
