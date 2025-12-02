# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://github.com/apache/tvm-ffi/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

DEPEND="
"
RDEPEND="${DEPEND}
	python? (
		${PYTHON_DEPS}
		dev-python/numpy[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	dev-libs/libbacktrace
	sci-libs/dlpack
	python? (
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
	)
"
REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"
RESTRICT="test"

wrap_python() {
	if use python; then
		local phase=$1
		distutils-r1_${phase} "$@"
	fi
}

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/system-backtrace.patch \
		"${FILESDIR}"/install-fix.patch
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i CMakeLists.txt
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
	cmake_src_configure
	wrap_python ${FUNCNAME}
}

python_configure_all() {
	DISTUTILS_ARGS=(
		-DTVM_FFI_BUILD_PYTHON_MODULE=ON
	)
}

src_compile() {
	cmake_src_compile
	wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}
