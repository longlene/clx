# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Modern book format and toolchain using Git and Markdown"
HOMEPAGE="https://www.gitbook.com"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/escape-string-regexp
dev-nodejs/hightlightjs
dev-nodejs/spawn-cmd
dev-nodejs/request
dev-nodejs/URIjs
dev-nodejs/dom-serializer
dev-nodejs/bash-color
dev-nodejs/crc
dev-nodejs/tmp
dev-nodejs/tiny-lr
dev-nodejs/send
dev-nodejs/chokidar
dev-nodejs/gitbook-plugin-livereload
dev-nodejs/cheerio
dev-nodejs/npmi
dev-nodejs/semver
dev-nodejs/fstream-ignore
dev-nodejs/gitbook-parsers
dev-nodejs/i18n
dev-nodejs/nunjucks-filter
dev-nodejs/nunjucks-autoescape
dev-nodejs/nunjucks
dev-nodejs/lodash
dev-nodejs/fs-extra
dev-nodejs/resolve
dev-nodejs/graceful-fs
dev-nodejs/q
dev-nodejs/lunr
"
