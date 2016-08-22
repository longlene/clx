# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A RSS/Atom parsing and generating library"
HOMEPAGE="https://github.com/fiddlerwoaroof/alimenta"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fiddlerwoaroof/alimenta.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/chronicity
	dev-lisp/drakma
	dev-lisp/for
	dev-lisp/fwoar_lisputils
	dev-lisp/lquery
	dev-lisp/plump
	dev-lisp/serapeum
	dev-lisp/should-test
	dev-lisp/spinneret
	dev-lisp/split-sequence
"
