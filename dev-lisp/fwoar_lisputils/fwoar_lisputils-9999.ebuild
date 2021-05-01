# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Some utilities common to other libraries"
HOMEPAGE="https://github.com/fiddlerwoaroof/fwoar.lisputils"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fiddlerwoaroof/fwoar.lisputils.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/plump
"
