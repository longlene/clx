# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="C++11 and boost based implementation of the DICOM standard"
HOMEPAGE="https://github.com/mariusherzog/dicom"
SRC_URI="https://github.com/mariusherzog/dicom/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.a ${BUILD_DIR}/source/liblibdicompp.a
	insinto /usr/include
	doins -r include/libdicompp
	dodoc README.md
}
