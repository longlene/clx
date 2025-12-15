# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1 vcs-snapshot

DESCRIPTION="Optimized inference engine for OpenNMT models"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"
SRC_URI="
	https://github.com/OpenNMT/CTranslate2/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/ruy/archive/c31af31ad62cc74650b04368cd9369a389d23248.tar.gz -> ruy-c31af31ad62cc74650b04368cd9369a389d23248.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cuda mkl blas python"

DEPEND="
	dev-libs/cpu_features
	dev-libs/cxxopts
	dev-libs/spdlog
	mkl? ( sci-libs/mkl )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	blas? ( sci-libs/openblas )
"
RDEPEND="${DEPEND}
	python? (
		${PYTHON_DEPS}
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	python? (
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
	)
"
REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

RESTRICT="test"
CMAKE_IN_SOURCE_BUILD=1

export CTRANSLATE2_ROOT="${S}"

wrap_python() {
	if use python; then
		local phase=$1
		pushd python >/dev/null || die
		distutils-r1_${phase} "$@"
		popd >/dev/null || die
	fi
}

pkg_setup() {
	python_setup
}

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/system-spdlog.patch \
		"${FILESDIR}"/system-cpu-features.patch \
		"${FILESDIR}"/system-thrust.patch \
		"${FILESDIR}"/system-cxxopts.patch \
		"${FILESDIR}"/setup-fix.patch
	rmdir third_party/ruy && ln -sv ${WORKDIR}/ruy-c31af31ad62cc74650b04368cd9369a389d23248 third_party/ruy
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	local mycmakeargs=(
		-DWITH_MKL=$(usex mkl)
		-DWITH_OPENBLAS=$(usex blas)
		-DWITH_CUDA=$(usex cuda)
		-DWITH_CUDNN=$(usex cuda)
		-DOPENMP_RUNTIME=NONE
		-DENABLE_CPU_DISPATCH=OFF
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
