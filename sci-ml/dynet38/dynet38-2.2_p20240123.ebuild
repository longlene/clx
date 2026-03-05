# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit cmake distutils-r1

EGIT_COMMIT="79e80bfa56867319f35e14d8a7098d0da93ab243"

DESCRIPTION="The Dynamic Neural Network Toolkit"
HOMEPAGE="
	https://pypi.org/project/dyNET38/
	https://github.com/taishi-i/dynet
"
SRC_URI="
	https://github.com/taishi-i/dynet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

RDEPEND="
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/dynet-${EGIT_COMMIT}

export EIGEN3_INCLUDE_DIR="/usr/include/eigen3"

CMAKE_IN_SOURCE_BUILD=1

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	eapply "${FILESDIR}"/build-fix.patch
	cmake_src_prepare
	use python && distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBACKEND=eigen
	)
	#if use cuda ; then
	#	mycmakeargs+=(
	#		-DBACKEND=cuda
	#		-DCUDA_ARCH=50
	#	)
	#else
	#	mycmakeargs+=(
	#	)
	#fi
	cmake_src_configure
	use python && distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	use python && distutils-r1_src_compile
}

src_install() {
	cmake_src_install
	use python && distutils-r1_src_install
}
