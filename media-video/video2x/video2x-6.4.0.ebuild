# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

LIBREALCUGAN_COMMIT="d9c5a7eb4c8475af6110496c27c3d1f702f9b96a"
LIBREALESRGAN_COMMIT="c1f255524f79566c40866b38e5e65b40adf77eee"
LIBRIFE_COMMIT="3f7bcb44f38b2acda6fa5e575a6d12517ac16b94"

DESCRIPTION="A machine learning-based video super resolution and frame interpolation framework"
HOMEPAGE="
	https://docs.video2x.org/
	https://github.com/k4yt3x/video2x/
"
SRC_URI="
	https://github.com/k4yt3x/video2x/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/k4yt3x/librealcugan-ncnn-vulkan/archive/${LIBREALCUGAN_COMMIT}.tar.gz -> librealcugan-ncnn-vulkan-${LIBREALCUGAN_COMMIT}.tar.gz
	https://github.com/k4yt3x/librealesrgan-ncnn-vulkan/archive/${LIBREALESRGAN_COMMIT}.tar.gz -> librealesrgan-ncnn-vulkan-${LIBREALESRGAN_COMMIT}.tar.gz
	https://github.com/k4yt3x/librife-ncnn-vulkan/archive/${LIBRIFE_COMMIT}.tar.gz -> librife-ncnn-vulkan-${LIBRIFE_COMMIT}.tar.gz
"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/boost
	dev-libs/ncnn
	dev-libs/spdlog
	dev-util/vulkan-headers
	media-video/ffmpeg[libplacebo]
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rmdir third_party/librealcugan_ncnn_vulkan && ln -sv "${WORKDIR}"/librealcugan-ncnn-vulkan-${LIBREALCUGAN_COMMIT} third_party/librealcugan_ncnn_vulkan
	rmdir third_party/librealesrgan_ncnn_vulkan && ln -sv "${WORKDIR}"/librealesrgan-ncnn-vulkan-${LIBREALESRGAN_COMMIT} third_party/librealesrgan_ncnn_vulkan
	rmdir third_party/librife_ncnn_vulkan && ln -sv "${WORKDIR}"/librife-ncnn-vulkan-${LIBRIFE_COMMIT} third_party/librife_ncnn_vulkan
	cmake_src_prepare
}
