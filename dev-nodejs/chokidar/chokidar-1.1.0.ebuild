# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="A neat wrapper around node.js fs.watch/fs.watchFile/fsevents"
HOMEPAGE="https://github.com/paulmillr/chokidar"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/fsevents
dev-nodejs/readdirp
dev-nodejs/path-is-absolute
dev-nodejs/is-glob
dev-nodejs/is-binary-path
dev-nodejs/glob-parent
dev-nodejs/async-each
dev-nodejs/arrify
dev-nodejs/anymatch
"
