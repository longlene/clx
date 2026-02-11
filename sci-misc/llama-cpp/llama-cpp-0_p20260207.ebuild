# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="9a5f57795c01c6e67a53eeedeae67ed63aaf7f8e"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"
SRC_URI="
	https://github.com/ggml-org/llama.cpp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
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
