# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Static analysis tool for JavaScript"
HOMEPAGE="https://www.npmjs.com/package/jshint"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-nodejs/lodash
	dev-nodejs/strip-json-comments
	dev-nodejs/shelljs
	dev-nodejs/minimatch
	dev-nodejs/htmlparser2
	dev-nodejs/exit
	dev-nodejs/console-browserify
	dev-nodejs/cli
"
