# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Command line interface for Hexo"
HOMEPAGE="https://github.com/hexojs/hexo-cli"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/abbrev
dev-nodejs/bluebird
dev-nodejs/chalk
dev-nodejs/hexo-fs
dev-nodejs/minimist
dev-nodejs/tildify
"
