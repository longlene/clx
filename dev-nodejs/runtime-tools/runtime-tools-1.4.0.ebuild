# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="runtime.js tools"
HOMEPAGE="https://github.com/runtimejs/runtime-tools"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/shelljs
dev-nodejs/request
dev-nodejs/nugget
dev-nodejs/minimist
dev-nodejs/chalk
"
