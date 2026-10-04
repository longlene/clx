# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Lightweight C++ inference runtime for NeMo speech models"
HOMEPAGE="https://github.com/NVIDIA/NeMo-Speech.cpp"

# Submodule pins at v0.2.0. The build has no find_package path for any of
# them (ggml/llama.cpp are always add_subdirectory'd from a source tree),
# so every submodule is vendored as a distfile and copied into the tree.
LLAMA_CPP_SHA="bd4f514db14d87fded667787a7a963bfbaa98e89"
RIVA_COMMON_SHA="71df98266725320a6b6b3a9f32a6da832dc93691"
FLASHLIGHT_TEXT_SHA="49e163ab1e7b8108922512c294ab8513b89f404c"
KENLM_SHA="4cb443e60b7bf2c0ddf3c745378f76cb59e254e5"
CPPJIEBA_SHA="b3602bef7d1f67521a61788a74fb5801a0e62cd3"
LIMONP_SHA="9d74077dfcdf8073536c97a00bb79d7a3c3fdaba"
HTTPLIB_SHA="62d899feac3cf9215a55f2b43da250fdd98d2156"

SRC_URI="
	https://github.com/NVIDIA/NeMo-Speech.cpp/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
	https://github.com/ggml-org/llama.cpp/archive/${LLAMA_CPP_SHA}.tar.gz
		-> llama-cpp-${LLAMA_CPP_SHA}.gh.tar.gz
	https://github.com/nvidia-riva/common/archive/${RIVA_COMMON_SHA}.tar.gz
		-> riva-common-${RIVA_COMMON_SHA}.gh.tar.gz
	https://github.com/flashlight/text/archive/${FLASHLIGHT_TEXT_SHA}.tar.gz
		-> flashlight-text-${FLASHLIGHT_TEXT_SHA}.gh.tar.gz
	https://github.com/kpu/kenlm/archive/${KENLM_SHA}.tar.gz
		-> kenlm-${KENLM_SHA}.gh.tar.gz
	https://github.com/yanyiwu/cppjieba/archive/${CPPJIEBA_SHA}.tar.gz
		-> cppjieba-${CPPJIEBA_SHA}.gh.tar.gz
	https://github.com/yanyiwu/limonp/archive/${LIMONP_SHA}.tar.gz
		-> limonp-${LIMONP_SHA}.gh.tar.gz
	https://github.com/yhirose/cpp-httplib/archive/${HTTPLIB_SHA}.tar.gz
		-> cpp-httplib-${HTTPLIB_SHA}.gh.tar.gz
"

S="${WORKDIR}/NeMo-Speech.cpp-${PV}"

LICENSE="Apache-2.0 BSD MIT LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
# CMake FATALs on invalid combinations (flashlight needs asr; grpc needs
# asr+text-to-speech; zh needs text-to-speech; s2s forces asr on; tls needs
# http), so no extra flag wiring is needed here.
IUSE="+asr +cli +diar +mic-capture +text-to-speech cuda
	flashlight grpc http nmt s2s tls zh"

DEPEND="
	asr? (
		dev-cpp/abseil-cpp
		sci-ml/sentencepiece
	)
	asr? ( cli? ( mic-capture? ( media-libs/alsa-lib ) ) )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	grpc? (
		dev-libs/protobuf
		net-libs/grpc
	)
	tls? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

# Absolute path: this slim portage's `ebuild` runner sets FILESDIR to
# ${WORKDIR}/files, which breaks the usual "${FILESDIR}" convention.
PATCHES=(
	"/usr/local/portage/sci-misc/nemo-speech-cpp/files/${P}-cxx20.patch"
	"/usr/local/portage/sci-misc/nemo-speech-cpp/files/${P}-cxx20-paths.patch"
	"/usr/local/portage/sci-misc/nemo-speech-cpp/files/${P}-docdir.patch"
)

inherit cmake

src_prepare() {
	cmake_src_prepare

	# Populate the vendored submodule trees (GitHub archives carry no git
	# metadata; CMake only checks for plain source dirs).
	local top
	# GitHub SHA archives extract to <repo>-<sha> top-level dirs.
	for top in \
		"llama.cpp-${LLAMA_CPP_SHA}:llama.cpp" \
		"common-${RIVA_COMMON_SHA}:proto/riva-common" \
		"text-${FLASHLIGHT_TEXT_SHA}:third_party/flashlight-text" \
		"kenlm-${KENLM_SHA}:third_party/kenlm" \
		"cppjieba-${CPPJIEBA_SHA}:third_party/cppjieba" \
		"cpp-httplib-${HTTPLIB_SHA}:third_party/cpp-httplib"; do
		local src="${top%%:*}" dest="${top#*:}"
		rm -rf "${S}/${dest}" || die
		cp -r "${WORKDIR}/${src}" "${S}/${dest}" || die
	done

	# Nested submodule: limonp inside cppjieba, after the parent tree.
	rm -rf "${S}/third_party/cppjieba/deps/limonp" || die
	cp -r "${WORKDIR}/limonp-${LIMONP_SHA}" \
		"${S}/third_party/cppjieba/deps/limonp" || die
}

src_configure() {
	local mycmakeargs=(
		# Build the vendored llama.cpp tree as-is (skips the in-tree patch
		# materializer, which needs git metadata the archive lacks). With an
		# unpatched tree the code must use stock ggml ops only, so the
		# patched-op paths stay off (small latency cost on CUDA).
		-DNEMO_SPEECH_LLAMA_CPP_SOURCE_DIR="${S}/llama.cpp"
		-DNEMO_SPEECH_GGML_PATCHED=OFF
		-DNEMO_SPEECH_BUILD_ASR=$(usex asr)
		-DNEMO_SPEECH_BUILD_DIAR=$(usex diar)
		-DNEMO_SPEECH_BUILD_TTS=$(usex text-to-speech)
		-DNEMO_SPEECH_BUILD_NMT=$(usex nmt)
		-DNEMO_SPEECH_BUILD_S2S=$(usex s2s)
		-DNEMO_SPEECH_BUILD_CLI=$(usex cli)
		-DNEMO_SPEECH_BUILD_MIC_CAPTURE=$(usex mic-capture)
		-DNEMO_SPEECH_BUILD_HTTP=$(usex http)
		-DNEMO_SPEECH_HTTP_TLS=$(usex tls)
		-DNEMO_SPEECH_BUILD_GRPC=$(usex grpc)
		-DNEMO_SPEECH_WITH_FLASHLIGHT=$(usex flashlight)
		-DNEMO_SPEECH_TTS_WITH_ZH=$(usex zh)
		-DNEMO_SPEECH_BUILD_TOOLS=OFF
		-DNEMO_SPEECH_BUILD_EXAMPLES=OFF
		-DBUILD_TESTING=OFF
	)
	# ggml auto-enables its CUDA backend when a toolkit is found, so the
	# flag must be pinned explicitly. compute_80 PTX is JIT-portable across
	# sm_80..Blackwell (the in-tree cublas shim uses the same default).
	mycmakeargs+=( -DGGML_CUDA=$(usex cuda ON OFF) )
	use cuda && mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES=80-virtual )
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install
}
