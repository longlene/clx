# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

MY_PN=${PN/_/.}
MY_P=${MY_PN}-${PV}

DESCRIPTION="Client for the realtime Engine"
HOMEPAGE="https://github.com/Automattic/engine.io-client"
SRC_URI="http://registry.npmjs.org/${MY_PN}/-/${MY_P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xmlhttprequest
dev-nodejs/ws
dev-nodejs/parseuri
dev-nodejs/parseqs
dev-nodejs/parsejson
dev-nodejs/indexof
dev-nodejs/has-cors
dev-nodejs/engine_io-parser
dev-nodejs/debug
dev-nodejs/component-inherit
dev-nodejs/component-emitter
"
