# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fefd97988bd558ca94d0b0db9de932fb3203ad77"

DESCRIPTION="Portable Websocket Server for Common Lisp"
HOMEPAGE="https://github.com/charJe/portal/"
SRC_URI="https://github.com/charJe/portal/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/alexandria
	dev-lisp/arrows
	dev-lisp/global-vars
	dev-lisp/str
	dev-lisp/ironclad
	dev-lisp/cl-base64
	dev-lisp/flexi-streams
"
BDEPEND=""
