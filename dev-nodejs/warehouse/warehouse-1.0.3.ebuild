# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Simple JSON-based database"
HOMEPAGE="https://github.com/tommy351/warehouse"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/lodash
dev-nodejs/graceful-fs
dev-nodejs/cuid
dev-nodejs/bluebird
dev-nodejs/JSONStream
"
