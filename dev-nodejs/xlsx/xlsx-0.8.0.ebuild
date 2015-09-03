# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit npm

DESCRIPTION="Excel(XLSB/XLSX/XLSM/XLS/XML) and ODS spreadsheet parser and writer"
HOMEPAGE="https://github.com/SheetJS/js-xlsx"
#SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-nodejs/commander
dev-nodejs/adler_32
dev-nodejs/crc_32
dev-nodejs/jszip
dev-nodejs/cfb
dev-nodejs/codepage
dev-nodejs/ssf
"
