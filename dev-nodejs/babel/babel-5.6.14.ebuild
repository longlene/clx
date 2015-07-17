# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Turn ES6 code into readable vanilla ES5 with source maps"
HOMEPAGE="https://github.com/babel/babel"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/babel-core
dev-nodejs/chokidar
dev-nodejs/commander
dev-nodejs/convert-source-map
dev-nodejs/fs-readdir-recursive
dev-nodejs/glob
dev-nodejs/lodash
dev-nodejs/output-file-sync
dev-nodejs/path-exists
dev-nodejs/path-is-absolute
dev-nodejs/source-map
dev-nodejs/slash
"
