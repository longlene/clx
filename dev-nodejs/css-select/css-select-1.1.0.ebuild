# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="a CSS selector compiler/engine"
HOMEPAGE="https://github.com/fb55/css-select"
#SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/nth-check
dev-nodejs/boolbase
dev-nodejs/domutils
dev-nodejs/css-what
"
