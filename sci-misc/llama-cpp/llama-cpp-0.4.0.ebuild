# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

# v${PV} stable releases ship no UI bundle of their own; the release's
# nightly-tag.txt asset points at the nightly build whose UI to use.
MY_UI_TAG="b10809"

DESCRIPTION="Port of Facebook's LLaMA model in C/C++"
HOMEPAGE="https://github.com/ggml-org/llama.cpp"
SRC_URI="
	https://github.com/ggml-org/llama.cpp/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/ggml-org/llama.cpp/releases/download/${MY_UI_TAG}/llama-${MY_UI_TAG}-ui.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="ssl test"
RESTRICT="!test? ( test )"

DEPEND="
	>=sci-ml/ggml-0.23.0
	ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

src_prepare() {
	cmake_src_prepare
	# Seed tools/ui/dist from the release UI tarball so ui-assets.cmake
	# picks it up as SRC_DIST_DIR without running an npm build.
	local ui_dist="${S}/tools/ui/dist"
	mkdir -p "${ui_dist}"
	cp -r "${WORKDIR}/llama-${MY_UI_TAG}-ui"/. "${ui_dist}/" || die
}

src_configure() {
	local mycmakeargs=(
		-DLLAMA_USE_SYSTEM_GGML=ON
		-DLLAMA_BUILD_TESTS=$(usex test)
		-DLLAMA_OPENSSL=$(usex ssl)
		-DLLAMA_USE_PREBUILT_UI=OFF
	)
	cmake_src_configure
	# copy_src_dist in scripts/ui-assets.cmake only copies the fixed ASSETS
	# list into the build dir, but the hashed bundle.*.js/bundle.*.css and
	# workbox-*.js are globbed from there — seed the full tree so they get
	# embedded too
	mkdir -p "${BUILD_DIR}/tools/ui/dist"
	cp -r "${S}/tools/ui/dist"/. "${BUILD_DIR}/tools/ui/dist/" || die
}

src_install() {
	cmake_src_install
	newinitd "${FILESDIR}"/llama-server.initd llama-server
	newconfd "${FILESDIR}"/llama-server.confd llama-server
}
