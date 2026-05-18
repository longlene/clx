# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="3a92bc99db3a9737b2688ee038f871760fe3ad34"
LLAMA_UI_VER="b9174"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"
SRC_URI="
	https://github.com/ggml-org/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	https://huggingface.co/buckets/ggml-org/llama-ui/resolve/${LLAMA_UI_VER}/index.html -> llama-ui-${LLAMA_UI_VER}-index.html
	https://huggingface.co/buckets/ggml-org/llama-ui/resolve/${LLAMA_UI_VER}/bundle.js -> llama-ui-${LLAMA_UI_VER}-bundle.js
	https://huggingface.co/buckets/ggml-org/llama-ui/resolve/${LLAMA_UI_VER}/bundle.css -> llama-ui-${LLAMA_UI_VER}-bundle.css
	https://huggingface.co/buckets/ggml-org/llama-ui/resolve/${LLAMA_UI_VER}/loading.html -> llama-ui-${LLAMA_UI_VER}-loading.html
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ssl test"

DEPEND="
	net-misc/curl
	sci-ml/ggml
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"
BEPEND=""

src_prepare() {
	cmake_src_prepare
	local ui_dist="${S}/build/tools/ui/dist"
	mkdir -p "${ui_dist}"
	cp "${DISTDIR}/llama-ui-${LLAMA_UI_VER}-index.html" "${ui_dist}/index.html" || die
	cp "${DISTDIR}/llama-ui-${LLAMA_UI_VER}-bundle.js" "${ui_dist}/bundle.js" || die
	cp "${DISTDIR}/llama-ui-${LLAMA_UI_VER}-bundle.css" "${ui_dist}/bundle.css" || die
	cp "${DISTDIR}/llama-ui-${LLAMA_UI_VER}-loading.html" "${ui_dist}/loading.html" || die
}

src_configure() {
	local mycmakeargs=(
		-DLLAMA_USE_SYSTEM_GGML=ON
		-DLLAMA_BUILD_TESTS=OFF
		-DLLAMA_CURL=ON
		-DLLAMA_BUILD_TESTS=$(usex test)
		-DLLAMA_OPENSSL=$(usex ssl)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	newinitd "${FILESDIR}"/llama-server.initd llama-server
	newconfd "${FILESDIR}"/llama-server.confd llama-server
}
