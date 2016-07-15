# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="Node.js compression middleware"
HOMEPAGE="https://github.com/expressjs/compression"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/vary
	dev-nodejs/on-headers
	dev-nodejs/debug
	dev-nodejs/compressible
	dev-nodejs/bytes
	dev-nodejs/accepts
"
