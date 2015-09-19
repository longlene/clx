# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="minimalist wget clone written in node"
HOMEPAGE="https://github.com/maxogden/nugget"
#SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/throttleit
dev-nodejs/single-line-log
dev-nodejs/request
dev-nodejs/progress-stream
dev-nodejs/pretty-bytes
dev-nodejs/minimist
dev-nodejs/debug
"
