# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

MY_PV="$(ver_rs 1-2 '')"
MY_P="${PN}-${MY_PV}"

EGL_REGISTRY_COMMIT="3d7796b3721d93976b6bfe536aa97bbc4bce8667"
OPENGL_REGISTRY_COMMIT="9cb90ca4902d588bef3c830fbb1da484893bd5fb"
SPIRV_TOOLS_COMMIT="ff5c50339cc1e9f34f04cb440a3e5fe89db0161d"
SPIRV_HEADERS_COMMIT="ad9184e76a66b1001c29db9b0a3e87f646c64de0"

DESCRIPTION="Native WebGPU implementation"
HOMEPAGE="https://github.com/google/dawn"
SRC_URI="
	https://github.com/google/dawn/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/KhronosGroup/EGL-Registry/archive/${EGL_REGISTRY_COMMIT}.tar.gz -> EGL-Registry-${EGL_REGISTRY_COMMIT}.tar.gz
	https://github.com/KhronosGroup/OpenGL-Registry/archive/${OPENGL_REGISTRY_COMMIT}.tar.gz -> OpenGL-Registry-${OPENGL_REGISTRY_COMMIT}.tar.gz
	https://github.com/KhronosGroup/SPIRV-Tools/archive/${SPIRV_TOOLS_COMMIT}.tar.gz -> SPIRV-Tools-${SPIRV_TOOLS_COMMIT}.tar.gz
	https://github.com/KhronosGroup/SPIRV-Headers/archive/${SPIRV_HEADERS_COMMIT}.tar.gz -> SPIRV-Headers-${SPIRV_HEADERS_COMMIT}.tar.gz
"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gles2 glfw opengl vulkan wayland X"

DEPEND="
	dev-cpp/abseil-cpp
	dev-util/glslang
	media-libs/mesa[X,opengl?,vulkan?,wayland?]
	glfw? ( media-libs/glfw )
	vulkan? ( dev-util/vulkan-utility-libraries)
    wayland? (
        >=dev-libs/wayland-1.20.0[${MULTILIB_USEDEP}]
        >=dev-libs/wayland-protocols-1.15
    )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}

PATCHES=(
	"${FILESDIR}"/system-deps.patch
)

src_configure() {
	local mycmakeargs=(
		-DDAWN_ENABLE_INSTALL=ON
		-DDAWN_ENABLE_DESKTOP_GL=$(usex opengl)
		-DDAWN_ENABLE_OPENGLES=$(usex gles2)
		-DDAWN_ENABLE_VULKAN=$(usex vulkan)
		-DDAWN_USE_WAYLAND=$(usex wayland)
		-DDAWN_USE_X11=$(usex X)
		-DDAWN_USE_GLFW=$(usex glfw)
		-DDAWN_BUILD_SAMPLES=OFF
		-DDAWN_BUILD_TESTS=OFF
		-DDAWN_BUILD_PROTOBUF=OFF
		-DDAWN_EGL_REGISTRY_DIR="${WORKDIR}"/EGL-Registry-${EGL_REGISTRY_COMMIT}
		-DDAWN_OPENGL_REGISTRY_DIR="${WORKDIR}"/OpenGL-Registry-${OPENGL_REGISTRY_COMMIT}
		-DDAWN_SPIRV_TOOLS_DIR="${WORKDIR}"/SPIRV-Tools-${SPIRV_TOOLS_COMMIT}
		-DDAWN_SPIRV_HEADERS_DIR="${WORKDIR}"/SPIRV-Headers-${SPIRV_HEADERS_COMMIT}
		-DDAWN_BUILD_MONOLITHIC_LIBRARY=SHARED
		-DBUILD_SHARED_LIBS=OFF
		-DTINT_ENABLE_INSTALL=OFF
		-DTINT_BUILD_CMD_TOOLS=OFF
		-DTINT_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
