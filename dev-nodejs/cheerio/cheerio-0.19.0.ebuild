# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Tiny, fast, and elegant implementation of core jQuery designed specifically for the server"
HOMEPAGE="https://github.com/cheeriojs/cheerio"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/lodash
dev-nodejs/dom-serializer
dev-nodejs/htmlparser2
dev-nodejs/entities
dev-nodejs/css-select
"
