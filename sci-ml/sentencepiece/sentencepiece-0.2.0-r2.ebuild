# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1

DESCRIPTION="Text tokenizer for Neural Network-based text generation"
HOMEPAGE="https://github.com/google/sentencepiece"
SRC_URI="https://github.com/google/sentencepiece/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="python"

DEPEND="
	dev-libs/darts
"
RDEPEND="${DEPEND}
	python? ( ${PYTHON_DEPS} )
"
BDEPEND="${DEPEND}
	dev-cpp/abseil-cpp
	dev-libs/protobuf:=
	dev-util/google-perftools
	python? (
		${PYTHON_DEPS}
		${DISTUTILS_DEPS}
	)
"
REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

DOCS=(
	README.md
	doc/api.md
	doc/experiments.md
	doc/normalization.md
	doc/options.md
	doc/special_symbols.md
)

PATCHES=(
	"${FILESDIR}"/disable-strip.patch
)

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
	cmake_src_prepare
	wrap_python ${FUNCNAME}
}

src_configure() {
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
