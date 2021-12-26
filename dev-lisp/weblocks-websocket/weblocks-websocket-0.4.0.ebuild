# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Websocket support for Common Lisp framework weblocks"
HOMEPAGE="https://github.com/40ants/weblocks-websocket"
SRC_URI="https://github.com/40ants/weblocks-websocket/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/weblocks
	dev-lisp/weblocks-parenscript
	dev-lisp/websocket-driver
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.rst
}
