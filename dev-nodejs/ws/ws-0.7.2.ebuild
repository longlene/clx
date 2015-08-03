# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="simple to use, blazing fast and thoroughly tested websocket client, server and console for node.js"
HOMEPAGE="https://github.com/websockets/ws"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/utf-8-validate
dev-nodejs/bufferutil
dev-nodejs/ultron
dev-nodejs/options
"
