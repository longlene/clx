# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ggml private headers (e.g. ggml-backend-impl.h) not installed by sci-ml/ggml.
# cppjieba is a header-only C++ library used directly from source.
GGML_COMMIT="57ea0bc119d722d74594196cc5b494a34dd87be4"
CPPJIEBA_COMMIT="eed6bfe483105d1db4bfbebaf796f60c173d6e84"

inherit cmake

DESCRIPTION="On-device speech AI runtime for ASR, TTS, VAD, and voice cloning"
HOMEPAGE="https://github.com/RapidAI/RapidSpeech.cpp"
SRC_URI="
	https://github.com/RapidAI/RapidSpeech.cpp/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/ggml-org/ggml/archive/${GGML_COMMIT}.tar.gz
		-> ggml-${GGML_COMMIT:0:7}.tar.gz
	https://github.com/yanyiwu/cppjieba/archive/${CPPJIEBA_COMMIT}.tar.gz
		-> cppjieba-${CPPJIEBA_COMMIT:0:7}.tar.gz
	https://github.com/csukuangfj/openfst/archive/refs/tags/v1.8.5-2026-06-15.tar.gz
		-> openfst-1.8.5-2026-06-15.tar.gz
"

S="${WORKDIR}/RapidSpeech.cpp-${PV}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda vulkan"

DEPEND="
	sci-ml/ggml[cuda?,vulkan?]
"
RDEPEND="${DEPEND}"
PATCHES=(
	"${FILESDIR}/rapidspeech-cpp-1.2.0-system-ggml.patch"
)

src_prepare() {
	cp -a "${WORKDIR}/ggml-${GGML_COMMIT}/." "${S}/ggml/" || die
	cp -a "${WORKDIR}/cppjieba-${CPPJIEBA_COMMIT}/." "${S}/third_party/cppjieba/" || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DRS_BUILD_TESTS=OFF
		-DRS_BUILD_CLI=OFF
		-DRS_ENABLE_PYTHON=OFF
		-DRS_CUDA=$(usex cuda)
		-DRS_VULKAN=$(usex vulkan)
		-DFETCHCONTENT_SOURCE_DIR_OPENFST="${WORKDIR}/openfst-1.8.5-2026-06-15"
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	# Remove openfst headers/lib installed as FetchContent collateral
	rm -rf "${D}/usr/include/fst" || die
	find "${D}/usr/$(get_libdir)" -name "libfst*" -delete || die
	rm -rf "${D}/usr/share/licenses" || die
	insinto /usr/include
	doins "${S}/include/rapidspeech.h"
	insinto /usr/share/rapidspeech
	doins -r "${S}/rapidspeech/data/"*
	insinto /usr/share/rapidspeech/cppjieba
	doins -r "${S}/third_party/cppjieba/dict"
}
