# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit cmake distutils-r1

MY_PV="$(ver_rs 3 -)"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="A parallel programming interface for NVIDIA GPUs based on OpenSHMEM"
HOMEPAGE="
	https://github.com/NVIDIA/nvshmem
	https://docs.nvidia.com/nvshmem/api/index.html
"
SRC_URI="https://github.com/NVIDIA/nvshmem/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.gh.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mpi nccl python"

RESTRICT="test"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	nccl? (
		dev-libs/nccl
	)
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
"
BDEPEND="
	python? (
		${DISTUTILS_DEPS}
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/setuptools-scm[${PYTHON_USEDEP}]
	)
"

PATCHES=(
	"${FILESDIR}"/fix-libdir.patch
	"${FILESDIR}"/install-fix.patch
	"${FILESDIR}"/python-fix.patch
)

export CUDA_HOME="/opt/cuda"
export SHMEM_HOME="/usr"
export PACKAGE_NAME="nvshmem4py"
export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR="$(get_libdir)"
		-DNVSHMEM_MPI_SUPPORT=$(usex mpi)
		-DNVSHMEM_IBRC_SUPPORT=OFF
		-DNVSHMEM_USE_GDRCOPY=OFF
		-DNVSHMEM_USE_MLX5DV=OFF
		-DNVSHMEM_NVTX=ON
		-DNVSHMEM_BUILD_TESTS=OFF
		-DNVSHMEM_BUILD_EXAMPLES=OFF
		-DNVSHMEM_BUILD_WITH_CUTLASS=OFF
		-DNVSHMEM_BUILD_PYTHON_LIB=$(usex python)
		-DNVSHMEM_USE_NCCL=$(usex nccl)
	)
	if use python ; then
		local cuda_major
		cuda_major=$("${CUDA_HOME}/bin/nvcc" --version | grep -oP 'release \K[0-9]+') || die "cannot detect CUDA version"
		mycmakeargs+=(
			-DNVSHMEM4PY_CUDA_VERSIONS=${cuda_major}
		)
	fi
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
	use python && cmake_src_compile build_nvshmem4py_wheels
}

src_install() {
	cmake_src_install
	# The device ExternalProject's cmake_install.cmake bakes in the portage
	# build path as CMAKE_INSTALL_PREFIX.  When cmake re-runs it with
	# DESTDIR=${D}, files land in "${D}"/var/tmp/portage/…/build/lib/.
	# The correct copies are already installed under "${D}"/usr by the parent
	# project's own install() rules, so we just remove the stray tree.
	rm -rf "${D}"/var || die
	# cmake installs docs to share/doc/${PN}; rename to portage-versioned path
	if [[ -d "${D}"/usr/share/doc/${PN} ]]; then
		mv "${D}"/usr/share/doc/${PN} "${D}"/usr/share/doc/${PF} || die
	fi

	if use python; then
		local wheel
		wheel=$(ls "${BUILD_DIR}"/dist/*.whl | head -n1) || die "no wheel found"
		distutils_wheel_install "${D}" "${wheel}"
	fi
}
