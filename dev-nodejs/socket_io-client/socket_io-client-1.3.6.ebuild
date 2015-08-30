# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PN=${PN/_/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="socket.io client"
HOMEPAGE="https://github.com/Automattic/socket.io-client"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/backo2
dev-nodejs/to-array
dev-nodejs/parseuri
dev-nodejs/indexof
dev-nodejs/has-binary
dev-nodejs/scoket_io-parser
dev-nodejs/object-component
dev-nodejs/component-emitter
dev-nodejs/component-bind
dev-nodejs/engine_io-client
dev-nodejs/debug
"
