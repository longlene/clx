# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Swank backend for Node.js and in-browser JavaScript"
HOMEPAGE="https://github.com/swank-js/swank-js"
#SRC_URI=""

LICENSE="X11"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/socket_io-client
dev-nodejs/socket_io
"
