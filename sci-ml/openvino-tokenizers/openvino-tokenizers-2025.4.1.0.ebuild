# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{10..14} )

inherit cmake distutils-r1

SENTENCEPIECE_PV="0.2.1"

DESCRIPTION="OpenVINO Tokenizers extension"
HOMEPAGE="https://github.com/openvinotoolkit/openvino_tokenizers"
SRC_URI="
	https://github.com/openvinotoolkit/openvino_tokenizers/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/sentencepiece/archive/refs/tags/v${SENTENCEPIECE_PV}.tar.gz -> sentencepiece-${SENTENCEPIECE_PV}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

DEPEND="
	sci-ml/openvino[python?]
	dev-cpp/abseil-cpp
	dev-libs/re2
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
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

S="${WORKDIR}"/openvino_tokenizers-${PV}

src_prepare() {
	default
	eapply \
		"${FILESDIR}"/install-path.patch \
		"${FILESDIR}"/system-deps.patch \
		"${FILESDIR}"/py-build.patch
	cmake_src_prepare
	use python && distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
		-DENABLE_SYSTEM_ICU=ON
		-DFETCHCONTENT_SOURCE_DIR_SENTENCEPIECE="${WORKDIR}"/sentencepiece-${SENTENCEPIECE_PV}
		-DOPENVINO_TOKENIZERS_INSTALL_LIBDIR=$(get_libdir)
	)
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
