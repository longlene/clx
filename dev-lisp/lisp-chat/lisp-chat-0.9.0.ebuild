# Copyright 2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="An experimental chat written in Common Lisp"
HOMEPAGE="https://github.com/ryukinix/lisp-chat"
SRC_URI="https://github.com/ryukinix/lisp-chat/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/bordeaux-threads
	dev-lisp/clack
	dev-lisp/websocket-driver
	dev-lisp/yason
	dev-lisp/uuid
	dev-lisp/ningle
	dev-lisp/lack
"
