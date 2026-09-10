# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

COMMIT="e22260d5d5490b37b021b7f795079f386d553afd"

DESCRIPTION="From-scratch C++17 port of the insightface buffalo face-rec pipeline"
HOMEPAGE="https://github.com/mudler/face-detect.cpp"
SRC_URI="https://github.com/mudler/face-detect.cpp/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/face-detect.cpp-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda test"
RESTRICT="!test? ( test )"

DEPEND="
	sci-ml/ggml:=[cuda?]
	media-libs/libjpeg-turbo:=
"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-system-ggml.patch" )

src_configure() {
	local mycmakeargs=(
		-DFACEDETECT_BUILD_CLI=ON
		-DFACEDETECT_SHARED=OFF
		-DFACEDETECT_VENDOR_LIBJPEG=OFF
		-DFACEDETECT_BUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}

src_install() {
	dobin "${BUILD_DIR}/examples/cli/facedetect-cli"
	dolib.a "${BUILD_DIR}/libfacedetect.a"
	insinto /usr/include/facedetect
	doins include/*.h
	dodoc README.md
}
