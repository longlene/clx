# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="A DSL wrapping cl:format's syntax with something more lispy"
HOMEPAGE="https://github.com/fiddlerwoaroof/format-string-builder/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fiddlerwoaroof/format-string-builder.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/serapeum
"
