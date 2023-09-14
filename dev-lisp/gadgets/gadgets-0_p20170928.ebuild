# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8dee7581c552b17b17856ed2b689436afbb1417e"

DESCRIPTION="Ben McGunigle's utility collection"
HOMEPAGE="https://github.com/BnMcGn/gadgets"
SRC_URI="https://github.com/BnMcGn/gadgets/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-utilities
	dev-lisp/anaphora
	dev-lisp/alexandria
	dev-lisp/uiop
	dev-lisp/kebab
	dev-lisp/cl-hash-util
"
