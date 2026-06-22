# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{13..15} )
inherit cmake distutils-r1 dot-a

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

#DOCS=(
#	README.md
#	doc/api.md
#	doc/experiments.md
#	doc/normalization.md
#	doc/options.md
#	doc/special_symbols.md
#)

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

#CMAKE_IN_SOURCE_BUILD=true

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
	sed -i \
		-e "s:third_party/darts_clone/darts.h:darts.h:" \
		src/model_interface.h \
		src/normalizer.h \
		src/normalizer.cc \
		src/unigram_model.h \
		src/builder.cc \
		|| die
	cmake_src_prepare
	wrap_python ${FUNCNAME}
	sed \
		-e 's|@libprotobuf_lite@|protobuf-lite|' \
		-e "s|@includedir_for_pc_file@|${S}/src|" \
		-e "s|@libdir_for_pc_file@|${BUILD_DIR}/src|" \
		${PN}.pc.in \
		> python/${PN}.pc \
		|| die

	sed -e '/CMAKE_CXX_STANDARD /{s/)/ CACHE STRING "")/g}' -i CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		-DSPM_ABSL_PROVIDER=package
		-DSPM_PROTOBUF_PROVIDER=package
	)

	if has_version ">=dev-cpp/abseil-cpp-20260107.0"; then
		# needs >=c++20
		mycmakeargs+=(
			-DCMAKE_CXX_STANDARD=20
		)
	fi

	cmake_src_configure
	wrap_python ${FUNCNAME}
}

src_compile() {
	cmake_src_compile
	PKG_CONFIG_PATH=. wrap_python ${FUNCNAME}
}

src_install() {
	cmake_src_install
	wrap_python ${FUNCNAME}
}
