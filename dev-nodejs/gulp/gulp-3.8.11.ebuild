# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="The streaming build system"
HOMEPAGE="https://github.com/gulpjs/gulp"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/archy
dev-nodejs/chalk
dev-nodejs/deprecated
dev-nodejs/gulp-util
dev-nodejs/interpret
dev-nodejs/liftoff
dev-nodejs/minimist
dev-nodejs/orchestrator
dev-nodejs/pretty-hrtime
dev-nodejs/semver
dev-nodejs/tildify
dev-nodejs/v8flags
dev-nodejs/vinyl-fs
"
