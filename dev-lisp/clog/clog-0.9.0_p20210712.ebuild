# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0767c0354a2756410ba46f28821b45c7893a08a4"

DESCRIPTION="The Common Lisp Omnificent GUI"
HOMEPAGE="https://github.com/rabbibotton/clog"
SRC_URI="https://github.com/rabbibotton/clog/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/lack
	dev-lisp/websocket-driver
	dev-lisp/alexandria
	dev-lisp/hunchentoot
	dev-lisp/cl-ppcre
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-open-browser
	dev-lisp/mgl-pax
	dev-lisp/quri
"
BDEPEND=""