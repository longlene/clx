# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A complete and versatile web scraper"
HOMEPAGE="https://github.com/ruipgil/scraperjs"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/commander
dev-nodejs/request
dev-nodejs/phantom
dev-nodejs/jquery
dev-nodejs/cheerio
dev-nodejs/async
"
