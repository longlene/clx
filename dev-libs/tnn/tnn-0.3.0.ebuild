# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="A high-performance, lightweight neural network inference framework"
HOMEPAGE="https://github.com/Tencent/TNN"
SRC_URI="https://github.com/Tencent/TNN/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/tnn
	dolib.so ${BUILD_DIR}/libTNN.so*
	einstalldocs
}
