# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Web Application Framework for Common Lisp"
HOMEPAGE="https://github.com/m0cchi/strainer"
SRC_URI=""

EGIT_REPO_URI="https://github.com/m0cchi/strainer.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/trivial-mimes
	dev-lisp/uiop
	dev-lisp/local-time
	dev-lisp/cl-fad
	dev-lisp/woo
"
