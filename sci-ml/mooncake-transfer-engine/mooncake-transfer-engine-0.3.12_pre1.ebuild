# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

MY_PV="${PV/_pre/-pre}"

inherit cmake python-single-r1

DESCRIPTION="KV cache transfer engine for LLM serving (Mooncake)"
HOMEPAGE="https://github.com/kvcache-ai/Mooncake"
SRC_URI="https://github.com/kvcache-ai/Mooncake/archive/refs/tags/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/Mooncake-${MY_PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda test"
RESTRICT="!test? ( test )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	${PYTHON_DEPS}
	dev-cpp/yalantinglibs
	dev-cpp/asio
	dev-cpp/gflags:=
	dev-cpp/glog:=
	dev-cpp/yaml-cpp:=
	dev-libs/jsoncpp:=
	dev-python/pybind11[${PYTHON_SINGLE_USEDEP}]
	sys-cluster/rdma-core:=
	sys-process/numactl
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
"
RDEPEND="
	${DEPEND}
	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/msgpack[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	')
"
BDEPEND="${PYTHON_DEPS}"

src_prepare() {
	# Use system pybind11 instead of empty vendored submodule
	sed -i \
		's|add_subdirectory(\${CMAKE_CURRENT_SOURCE_DIR}/extern/pybind11)|find_package(pybind11 REQUIRED)|' \
		CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local pybind11_cmake_dir
	pybind11_cmake_dir="$(${PYTHON} -c 'import pybind11; print(pybind11.get_cmake_dir())')" || die

	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
		-Dpybind11_DIR="${pybind11_cmake_dir}"
		-DWITH_TE=ON
		-DWITH_STORE=OFF
		-DWITH_STORE_RUST=OFF
		-DWITH_P2P_STORE=OFF
		-DWITH_EP=OFF
		-DBUILD_UNIT_TESTS=$(usex test)
		-DBUILD_EXAMPLES=OFF
		-DBUILD_SHARED_LIBS=ON
		$(usex cuda -DUSE_CUDA=ON -DUSE_CUDA=OFF)
	)
	cmake_src_configure
}
