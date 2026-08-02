# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

LLAMACPP_COMMIT="a6b3260a4268d3c9931e0c47859fe4ff8f108bd9"

DESCRIPTION="Python wrapper for llama.cpp inference engine"
HOMEPAGE="https://github.com/xorbitsai/xllamacpp"
SRC_URI="
	https://github.com/xorbitsai/xllamacpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/ggerganov/llama.cpp/archive/${LLAMACPP_COMMIT}.tar.gz -> llama.cpp-${LLAMACPP_COMMIT:0:8}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"  # tests require a real GGUF model file at runtime

DEPEND="
	dev-libs/openssl:=
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-build/cmake
	dev-python/cython[${PYTHON_USEDEP}]
"

src_prepare() {
	rm -rf thirdparty/llama.cpp || die
	mv "${WORKDIR}/llama.cpp-${LLAMACPP_COMMIT}" thirdparty/llama.cpp || die

	# Use system OpenSSL instead of BoringSSL (no FetchContent network access in sandbox)
	# and disable llguidance (requires Rust/cargo; stub impl is used instead)
	sed -i '/LLAMACPP_LIBS_DIR.*libllguidance\.a/d' setup.py || die
	sed -i '/BoringSSL static libraries/d' setup.py || die
	sed -i '/LLAMACPP_LIBS_DIR.*libssl\.a/d' setup.py || die
	sed -i '/LLAMACPP_LIBS_DIR.*libcrypto\.a/d' setup.py || die
	# Link against system OpenSSL at extension link time
	sed -i 's/\["-fopenmp", "-static-libgcc"\]/["-fopenmp", "-static-libgcc", "-lssl", "-lcrypto"]/' \
		setup.py || die
	# Define CPPHTTPLIB_OPENSSL_SUPPORT so server-http.cpp compiles consistently
	# with how libserver-context.a was compiled (cmake sets this when LLAMA_OPENSSL=ON)
	sed -i 's/DEFINE_MACROS = \[("Py_LIMITED_API"/DEFINE_MACROS = [("CPPHTTPLIB_OPENSSL_SUPPORT", 1), ("Py_LIMITED_API"/' \
		setup.py || die

	distutils-r1_src_prepare
}

python_compile() {
	# Override hardcoded cmake args: skip BoringSSL FetchContent and llguidance
	# ExternalProject (both require network access or Rust/cargo)
	CMAKE_ARGS="-DLLAMA_LLGUIDANCE=OFF -DLLAMA_BUILD_BORINGSSL=OFF -DLLAMA_OPENSSL=ON" \
		distutils-r1_python_compile
}
