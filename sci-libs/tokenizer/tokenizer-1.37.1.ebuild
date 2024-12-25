# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )

inherit cmake distutils-r1 flag-o-matic

DESCRIPTION="OpenNMT C++ tokenizer"
HOMEPAGE="https://github.com/OpenNMT/Tokenizer"
SRC_URI="
	https://github.com/OpenNMT/Tokenizer/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.0.0.tar.gz -> cxxopts-3.0.0.tar.gz
	https://github.com/google/sentencepiece/archive/refs/tags/v0.1.96.tar.gz -> sentencepiece-0.1.96.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-python"

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

S="${WORKDIR}"/Tokenizer-${PV}

export TOKENIZER_ROOT="${S}"

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
	eapply "${FILESDIR}"/system-sentencepiece.patch
	rmdir third_party/cxxopts && ln -sv "${WORKDIR}"/cxxopts-3.0.0 third_party/cxxopts
	rmdir third_party/sentencepiece && ln -sv "${WORKDIR}"/sentencepiece-0.1.96 third_party/sentencepiece
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
