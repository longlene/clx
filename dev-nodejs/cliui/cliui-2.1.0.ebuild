# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="easily create complex multi-column command-line-interfaces"
HOMEPAGE="https://github.com/bcoe/cliui"
#SRC_URI=""

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/center-align
dev-nodejs/right-align
dev-nodejs/wordwrap
"
