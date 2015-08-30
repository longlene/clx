# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PN=${PN/_/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="node.js realtime framework server"
HOMEPAGE="https://github.com/Automattic/socket.io"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/debug
dev-nodejs/has-binary-data
dev-nodejs/socket_io-adapter
dev-nodejs/socket_io-client
dev-nodejs/socket_io-parser
dev-nodejs/engine_io
"
