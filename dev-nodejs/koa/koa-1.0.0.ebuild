# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Koa web app framework"
HOMEPAGE="https://github.com/koajs/koa"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/vary
dev-nodejs/type-is
dev-nodejs/statuses
dev-nodejs/parseurl
dev-nodejs/only
dev-nodejs/on-finished
dev-nodejs/mime-types
dev-nodejs/koa-is-json
dev-nodejs/koa-compose
dev-nodejs/http-errors
dev-nodejs/http-assert
dev-nodejs/fresh
dev-nodejs/escape-html
dev-nodejs/error-inject
dev-nodejs/destroy
dev-nodejs/delegates
dev-nodejs/debug
dev-nodejs/cookies
dev-nodejs/content-type
dev-nodejs/content-disposition
dev-nodejs/composition
dev-nodejs/co
dev-nodejs/accepts
"
