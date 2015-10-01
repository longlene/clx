# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Recursive version of fs.readdir with streaming api"
HOMEPAGE="https://github.com/thlorenz/readdirp"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/readable-stream
dev-nodejs/minimatch
dev-nodejs/graceful-fs
"
