# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="JavaScript parser, mangler/compressor and beautifier toolkit"
HOMEPAGE="https://github.com/mishoo/UglifyJS2"
#SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/yargs
dev-nodejs/uglify-to-browserify
dev-nodejs/source-map
dev-nodejs/async
"
