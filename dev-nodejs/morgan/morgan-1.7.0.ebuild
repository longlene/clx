# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="HTTP request logger middleware for node.js"
HOMEPAGE="https://github.com/expressjs/morgan"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/on-headers
	dev-nodejs/on-finished
	dev-nodejs/depd
	dev-nodejs/debug
	dev-nodejs/basic-auth
"
