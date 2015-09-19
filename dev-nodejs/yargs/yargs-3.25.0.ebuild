# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Light-weight option parsing with an argv hash"
HOMEPAGE="https://github.com/bcoe/yargs"
#SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/y18n
dev-nodejs/window-size
dev-nodejs/os-locale
dev-nodejs/decamelize
dev-nodejs/cliui
dev-nodejs/camelcase
"
