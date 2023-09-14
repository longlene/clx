# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f530c71788b8ce58f12089f8fb2db329c8043771"

DESCRIPTION="A TOML parser written in Common Lisp"
HOMEPAGE="https://github.com/sgarciac/sawyer"
SRC_URI="https://github.com/sgarciac/sawyer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/lexer
	dev-lisp/parse
	dev-lisp/parse-number
	dev-lisp/re
	dev-lisp/alexandria
"
