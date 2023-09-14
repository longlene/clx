# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="A Common Lisp library to build fully dynamic web interfaces"
HOMEPAGE="https://github.com/hemml/OMGlib/"
SRC_URI="https://github.com/hemml/OMGlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/websocket-driver-server
	dev-lisp/bordeaux-threads
	dev-lisp/trivial-utf8
"
BDEPEND=""
