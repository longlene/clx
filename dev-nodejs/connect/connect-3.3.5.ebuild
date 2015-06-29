# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit npm

DESCRIPTION="High performance middleware framework"
HOMEPAGE="https://github.com/senchalabs/connect"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/debug
dev-nodejs/finalhandler
dev-nodejs/parseurl
dev-nodejs/utils-merge
"
