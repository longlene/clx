# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A delightful, performance-focused Redis client for Node and io.js"
HOMEPAGE="https://github.com/luin/ioredis"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/lodash
dev-nodejs/flexbuffer
dev-nodejs/double-ended-queue
dev-nodejs/debug
dev-nodejs/bluebird 
"
