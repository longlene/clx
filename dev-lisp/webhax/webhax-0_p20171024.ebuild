# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7e8411f0de5fa45761153c09f25e54acd6580f33"

DESCRIPTION="Set of utilities for throwing websites together quickly"
HOMEPAGE="https://github.com/BnMcGn/webhax"
SRC_URI="https://github.com/BnMcGn/webhax/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/gadgets
	dev-lisp/cl-who
	dev-lisp/parenscript
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-utilities
	dev-lisp/cl-cont
	dev-lisp/cl-json
	dev-lisp/clack
	dev-lisp/ningle
	dev-lisp/cl-react
	dev-lisp/userfig
	dev-lisp/optima
	dev-lisp/cl-markdown
"

