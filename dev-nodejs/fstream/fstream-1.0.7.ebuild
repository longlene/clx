# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="Advanced file system stream things"
HOMEPAGE="https://github.com/isaacs/fstream"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/mkdirp
dev-nodejs/rimraf
dev-nodejs/graceful-fs
dev-nodejs/inherits
"
