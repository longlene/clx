# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="A fast, simple & powerful blog framework, powered by Node.js"
HOMEPAGE="https://github.com/hexojs/hexo"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/abbrev
dev-nodejs/archy
dev-nodejs/bluebird
dev-nodejs/bunyan
dev-nodejs/chalk
dev-nodejs/cheerio
dev-nodejs/hexo-cli
dev-nodejs/hexo-front-matter
dev-nodejs/hexo-fs
dev-nodejs/hexo-i18n
dev-nodejs/hexo-util
dev-nodejs/js-yaml
dev-nodejs/lodash
dev-nodejs/minimatch
dev-nodejs/moment
dev-nodejs/moment-timezone
dev-nodejs/nunjucks
dev-nodejs/pretty-hrtime
dev-nodejs/strip-indent
dev-nodejs/swig
dev-nodejs/text-table
dev-nodejs/through2
dev-nodejs/tildify
dev-nodejs/titlecase
dev-nodejs/warehouse
"
