# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Node.js package to access serial ports"
HOMEPAGE="https://github.com/voodootikigod/node-serialport"
#SRC_URI=""

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/sf
dev-nodejs/optimist
dev-nodejs/node-pre-gyp
dev-nodejs/nan
dev-nodejs/debug
dev-nodejs/bindings
dev-nodejs/async
"
