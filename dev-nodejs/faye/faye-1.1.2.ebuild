# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Simple pub/sub messaging for the web"
HOMEPAGE="https://github.com/faye/faye"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/tunnel-agent
dev-nodejs/tough-cookie
dev-nodejs/faye-websocket
dev-nodejs/cspring
"
