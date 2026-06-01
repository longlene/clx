# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=$(ver_cut 3-3)

DESCRIPTION="PDFium binaries built with scripts from pdfium-binaries"
HOMEPAGE="https://github.com/bblanchon/pdfium-binaries"
SRC_URI="
	amd64? (
		https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${MY_PV}/pdfium-linux-x64.tgz
			-> ${P}-linux-x64.tar.gz
	)
	arm64? (
		https://github.com/bblanchon/pdfium-binaries/releases/download/chromium%2F${MY_PV}/pdfium-linux-arm64.tgz
			-> ${P}-linux-arm64.tar.gz
	)
"

S="${WORKDIR}"
LICENSE="|| ( Apache-2.0 BSD )"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/lib/cmake/PDFium
	doins PDFiumConfig.cmake
	dolib.so lib/libpdfium.so
	doheader include/fpdf*.h
	einstalldocs
}
