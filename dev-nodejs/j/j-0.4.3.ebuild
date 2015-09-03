# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="CLI tool for working with XLS/XLSX/XLSM/XLSB files"
HOMEPAGE="https://SheetJS/j"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/xlsx
dev-nodejs/commander
dev-nodejs/concat-stream
dev-nodejs/harb
dev-nodejs/spreadsheet
"
