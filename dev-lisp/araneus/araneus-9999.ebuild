# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A simple web framework"
HOMEPAGE="https://github.com/fiddlerwoaroof/araneus"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fiddlerwoaroof/araneus.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/serapeum
	dev-lisp/ningle
	dev-lisp/fwoar_lisputils
	dev-lisp/spinneret
	dev-lisp/cl-mustache
"
