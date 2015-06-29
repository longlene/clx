# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="a JSON logging library for node.js services"
HOMEPAGE="https://github.com/trentm/node-bunyan"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/dtrace-provider
dev-nodejs/mv
dev-nodejs/safe-json-stringify
"
