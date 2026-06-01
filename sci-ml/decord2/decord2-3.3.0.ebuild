# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

DLPACK_COMMIT="5c792cef3aee54ad8b7000111c9dc1797f327b59"
DMLC_CORE_COMMIT="d07fb7a443b5db8a89d65a15a024af6a425615a5"

DESCRIPTION="An efficient video loader for deep learning with smart shuffling that's"
HOMEPAGE="
	https://pypi.org/project/decord2/
	https://github.com/johnnynunez/decord2
"
SRC_URI="
	https://github.com/johnnynunez/decord2/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/dmlc/dlpack/archive/${DLPACK_COMMIT}.tar.gz -> dlpack-${DLPACK_COMMIT}.tar.gz
	https://github.com/dmlc/dmlc-core/archive/${DMLC_CORE_COMMIT}.tar.gz -> dmlc-core-${DMLC_CORE_COMMIT}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda python"

DEPEND+="
	media-video/ffmpeg
	cuda? ( dev-util/nvidia-cuda-toolkit:= )
"
RDEPEND="
	python? (
		>=dev-python/numpy-1.26.4[${PYTHON_USEDEP}]
	)
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

export DECORD_LIBRARY_PATH="${WORKDIR}/${P}_build"

PATCHES=(
	"${FILESDIR}"/install-fix.patch
)

wrap_python() {
	if use python; then
		pushd python > /dev/null || die
		local phase=$1
		distutils-r1_${phase} "$@"
		popd > /dev/null || die
	fi
}

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	rmdir 3rdparty/dlpack && ln -sv "${WORKDIR}"/dlpack-${DLPACK_COMMIT} 3rdparty/dlpack
	rmdir 3rdparty/dmlc-core && ln -sv "${WORKDIR}"/dmlc-core-${DMLC_CORE_COMMIT} 3rdparty/dmlc-core
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		# fix
		#-DUSE_CUDA=$(usex cuda)
	)
	use cuda && mycmakeargs+=(
		-DCMAKE_CUDA_ARCHITECTURES="70"
	)
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}
