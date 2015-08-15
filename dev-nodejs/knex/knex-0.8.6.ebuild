# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="A batteries-included SQL query & schema builder for Postgres, MySQL and SQLite3 and the Browser"
HOMEPAGE="http://knexjs.org"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/v8flags
dev-nodejs/tildify
dev-nodejs/readable-stream
dev-nodejs/pool2
dev-nodejs/mkdirp
dev-nodejs/minimist
dev-nodejs/lodash
dev-nodejs/liftoff
dev-nodejs/interpret
dev-nodejs/inherits
dev-nodejs/debug
dev-nodejs/commander
dev-nodejs/chalk
dev-nodejs/bluebird
"
