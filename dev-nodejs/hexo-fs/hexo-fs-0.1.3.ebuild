# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="File system module for Hexo"
HOMEPAGE="https://github.com/hexojs/hexo-fs"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/bluedbird
dev-nodejs/chokidar
dev-nodejs/escape-string-regexp
dev-nodejs/graceful-fs
"
