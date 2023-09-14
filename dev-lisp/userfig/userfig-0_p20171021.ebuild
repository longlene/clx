# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4643fe5c9aff54b1e59704c26312e4a060163ce0"

DESCRIPTION="User settings management middleware for Clack"
HOMEPAGE="https://github.com/BnMcGn/userfig"
SRC_URI="https://github.com/BnMcGn/userfig/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/gadgets
	dev-lisp/ubiquitous-concurrent
	dev-lisp/lack
	dev-lisp/parenscript
	dev-lisp/cl-react
	dev-lisp/ps-gadgets
	dev-lisp/cl-json
	dev-lisp/webhax-validate
	dev-lisp/webhax-core
	dev-lisp/webhax-route
	dev-lisp/webhax-widgets
	dev-lisp/http-body
	dev-lisp/cl-who
"
