# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Unzip cross-platform streaming API compatible with fstream and fs.ReadStream"
HOMEPAGE="https://github.com/EvanOxfeld/node-unzip"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/match-stream
dev-nodejs/setimmediate
dev-nodejs/readable-stream
dev-nodejs/binary
dev-nodejs/pullstream
dev-nodejs/fstream
"
