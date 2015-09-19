# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="CMake.js - a Node.js/io.js native addon build tool"
HOMEPAGE="https://github.com/unbornchikken/cmake-js"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/yargs
dev-nodejs/which
dev-nodejs/url-join
dev-nodejs/tar
dev-nodejs/splitargs
dev-nodejs/request
dev-nodejs/npmlog
dev-nodejs/npmconf
dev-nodejs/memory-stream
dev-nodejs/lodash
dev-nodejs/is-iojs
dev-nodejs/fs-extra
dev-nodejs/debug
dev-nodejs/bluebird
"
