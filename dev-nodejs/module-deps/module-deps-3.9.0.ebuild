# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="walk the dependency graph to generate json output that can be fed into browser-pack"
HOMEPAGE="https://github.com/substack/module-deps"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xtend
dev-nodejs/through2
dev-nodejs/subarg
dev-nodejs/stream-combiner2
dev-nodejs/resolve
dev-nodejs/readable-stream
dev-nodejs/parents
dev-nodejs/inherits
dev-nodejs/duplexer2
dev-nodejs/detective
dev-nodejs/defined
dev-nodejs/concat-stream
dev-nodejs/browser-resolve
dev-nodejs/JSONStream
"
