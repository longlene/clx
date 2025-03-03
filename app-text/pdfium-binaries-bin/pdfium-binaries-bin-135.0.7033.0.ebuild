# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=$(ver_cut 3-3)

DESCRIPTION="PDFium binaries built with scripts from pdfium-binaries"
HOMEPAGE="https://github.com/bblanchon/pdfium-binaries"
#SRC_URI="https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${MY_PV}/pdfium-linux-x64.tgz -> ${P}.tar.gz"
SRC_URI="https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${MY_PV}/pdfium-linux-x64.tgz -> ${P}.tar.gz"

LICENSE="|| ( Apache-2.0 BSD-3 )"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /usr/lib/cmake/PDFium
	doins PDFiumConfig.cmake
	dolib.so lib/libpdfium.so
	doheader include/fpdf*.h
	einstalldocs
}
