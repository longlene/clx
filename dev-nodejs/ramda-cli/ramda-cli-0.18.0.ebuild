# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A command-line tool for processing JSON with Ramda and LiveScript"
HOMEPAGE="https://www.npmjs.com/package/ramda-cli"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/treis
dev-nodejs/through2
dev-nodejs/stream-reduce
dev-nodejs/split2
dev-nodejs/ramda
dev-nodejs/minimist
dev-nodejs/livescript
dev-nodejs/is-there
dev-nodejs/flat
dev-nodejs/fast-csv
dev-nodejs/editor
dev-nodejs/debug
dev-nodejs/cli-table
dev-nodejs/camelize
dev-nodejs/JSONStream
"
