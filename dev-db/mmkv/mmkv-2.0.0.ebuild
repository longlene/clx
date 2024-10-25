# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION=""
HOMEPAGE="https://github.com/Tencent/MMKV"
SRC_URI="https://github.com/Tencent/MMKV/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/POSIX

src_install() {
	dolib.so "${BUILD_DIR}"/src/libmmkv.so
}
