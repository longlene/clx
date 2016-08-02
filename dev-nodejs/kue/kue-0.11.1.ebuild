# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit npm

DESCRIPTION="Feature rich priority job queue backed by redis"
HOMEPAGE="https://github.com/Automattic/kue"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/yargs
	dev-nodejs/stylus
	dev-nodejs/reds
	dev-nodejs/redis
	dev-nodejs/node-redis-warlock
	dev-nodejs/nib
	dev-nodejs/lodash-deep
	dev-nodejs/lodash
	dev-nodejs/jade
	dev-nodejs/express
	dev-nodejs/body-parser
"
