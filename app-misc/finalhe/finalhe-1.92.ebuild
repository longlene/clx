# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A tool to push h-encore exploit for PS VITA/PS TV automatically"
HOMEPAGE="https://github.com/soarqin/finalhe"
SRC_URI="https://github.com/soarqin/finalhe/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	virtual/libiconv
	sys-libs/zlib
	dev-libs/libxml2
	virtual/libusb
	dev-qt/qtwidgets
	dev-qt/qtnetwork
	dev-qt/linguist-tools
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	newbin ${BUILD_DIR}/src/FinalHE finalhe
	dodoc README.md
}
