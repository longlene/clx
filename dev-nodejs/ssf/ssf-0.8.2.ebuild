# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Format data using ECMA-376 spreadsheet Format Codes"
HOMEPAGE="https://github.com/SheetJS/ssf"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/colors
dev-nodejs/frac
dev-nodejs/voc
"
