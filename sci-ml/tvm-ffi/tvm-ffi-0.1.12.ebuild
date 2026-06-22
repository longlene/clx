# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=scikit-build-core
PYTHON_COMPAT=( python3_{13..15} )

inherit cmake distutils-r1

DESCRIPTION="Open ABI and FFI for Machine Learning Systems"
HOMEPAGE="
	https://github.com/apache/tvm-ffi/
"
SRC_URI="
	https://github.com/apache/tvm-ffi/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/typing-extensions-4.5[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-libs/libbacktrace
	sci-libs/dlpack
	${PYTHON_DEPS}
	${DISTUTILS_DEPS}
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

pkg_setup() {
	python_setup
}

src_prepare() {
	eapply \
		"${FILESDIR}"/system-backtrace.patch \
		"${FILESDIR}"/install-fix.patch \
		"${FILESDIR}"/gentoo-system-libpath.patch
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" \
		-i CMakeLists.txt
	# Replace setuptools-scm dynamic version detection with static version,
	# since the source tarball has no .git directory.
	sed -i \
		-e 's/^dynamic = \["version"\]$/version = "'"${PV}"'"/' \
		-e '/^metadata\.version\.provider/d' \
		-e 's/, "setuptools-scm"//' \
		pyproject.toml || die
	cmake_src_prepare
	distutils-r1_src_prepare
}

python_configure_all() {
	DISTUTILS_ARGS=(
		-DTVM_FFI_BUILD_PYTHON_MODULE=ON
	)
}

src_configure() {
	cmake_src_configure
	distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	distutils-r1_src_install
}
