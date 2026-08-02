# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="98f52c5ef2250f207cc6b9a6aef05393a120cb7c"

inherit cmake

DESCRIPTION="OpenAI privacy filter NER model in minimal C++/GGML runtime"
HOMEPAGE="https://github.com/localai-org/privacy-filter.cpp"
SRC_URI="https://github.com/localai-org/privacy-filter.cpp/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/privacy-filter.cpp-${MY_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda test tools vulkan"
RESTRICT="!test? ( test )"

DEPEND="sci-ml/ggml"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/privacy-filter-cpp-0_p20260619-system-ggml-install.patch"
)

src_configure() {
	local mycmakeargs=(
		-DPF_VULKAN=$(usex vulkan)
		-DPF_CUDA=$(usex cuda)
		-DPF_BUILD_TOOLS=$(usex tools)
		-DPF_BUILD_TESTS=$(usex test)
		-DPF_FUZZ=no
	)
	cmake_src_configure
}
