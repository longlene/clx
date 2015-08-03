# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="SSH2 client and server modules written in pure JavaScript for node.js"
HOMEPAGE="https://github.com/mscdex/ssh2"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/ssh2-streams
dev-nodejs/readable-stream
"
