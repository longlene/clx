# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Open Neural Network Exchange"
HOMEPAGE="https://onnx.ai"
SRC_URI="https://github.com/onnx/onnx/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm -r onnx/backend/test
	cmake_src_prepare
}
