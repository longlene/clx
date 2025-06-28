# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1 flag-o-matic

EGIT_COMMIT="75117755d6c7a24d46509f867726e446be05317f"
CXXOPTS_COMMIT="c74846a891b3cc3bfa992d588b1295f528d43039"
SENTENCEPIECE_COMMIT="273449044caa593c2fd7eb7550cb3ab2cff93f1a"

DESCRIPTION="OpenNMT C++ tokenizer"
HOMEPAGE="https://github.com/OpenNMT/Tokenizer"
SRC_URI="
	https://github.com/OpenNMT/Tokenizer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/jarro2783/cxxopts/archive/${CXXOPTS_COMMIT}.tar.gz -> cxxopts-${CXXOPTS_COMMIT}.tar.gz
	https://github.com/google/sentencepiece/archive/${SENTENCEPIECE_COMMIT}.tar.gz -> sentencepiece-${SENTENCEPIECE_COMMIT}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python"

DEPEND=""
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

S="${WORKDIR}"/Tokenizer-${EGIT_COMMIT}

export TOKENIZER_ROOT="${S}"
CMAKE_IN_SOURCE_BUILD=1

wrap_python() {
	local phase=$1
	if use python; then
		pushd bindings/python >/dev/null || die
		distutils-r1_${phase} "$@"
		popd >/dev/null || die
	fi
}

pkg_setup() {
	use python && python_setup
}

src_prepare() {
	default
	eapply "${FILESDIR}"/setup-fix.patch
	rmdir third_party/cxxopts && ln -sv "${WORKDIR}"/cxxopts-${CXXOPTS_COMMIT} third_party/cxxopts
	rmdir third_party/sentencepiece && ln -sv "${WORKDIR}"/sentencepiece-${SENTENCEPIECE_COMMIT} third_party/sentencepiece
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
