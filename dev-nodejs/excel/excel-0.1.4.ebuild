# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Simple NodeJS XLSX parser"
HOMEPAGE="https://github.com/trevordixon/excel.js"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/unzip
dev-nodejs/underscore
dev-nodejs/libxmljs
dev-nodejs/node-promise
"
