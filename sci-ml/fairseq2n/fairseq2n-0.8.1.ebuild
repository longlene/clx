# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit cmake python-single-r1

MY_PN="fairseq2"
MY_P="${MY_PN}-${PV}"

KUBA_ZIP_PV="0.3.8"
SP_COMMIT="58f256cf6f01bb86e6fa634a5cc560de5bd1667d"

DESCRIPTION="Native C++ library for the FAIR Sequence Modeling Toolkit 2"
HOMEPAGE="https://github.com/facebookresearch/fairseq2"
SRC_URI="
	https://github.com/facebookresearch/fairseq2/archive/refs/tags/v${PV}.tar.gz -> ${MY_P}.tar.gz
	https://github.com/kuba--/zip/archive/refs/tags/v${KUBA_ZIP_PV}.tar.gz -> kuba-zip-${KUBA_ZIP_PV}.gh.tar.gz
	https://github.com/google/sentencepiece/archive/${SP_COMMIT}.tar.gz -> sentencepiece-${SP_COMMIT}.tar.gz
"

S="${WORKDIR}"/${MY_P}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda python"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-cpp/tbb
	dev-libs/libfmt
	dev-libs/kaldi-native-fbank
	dev-libs/protobuf
	media-libs/libjpeg-turbo
	media-libs/libpng
	media-libs/libsndfile
	sci-ml/pytorch[${PYTHON_SINGLE_USEDEP}]
	sci-ml/sentencepiece
	python? (
		$(python_gen_cond_dep '
			dev-python/numpy[${PYTHON_USEDEP}]
		')
	)
"

DEPEND="
	${RDEPEND}
	python? (
		$(python_gen_cond_dep '
			dev-python/pybind11[${PYTHON_USEDEP}]
		')
	)
"

BDEPEND="
	dev-libs/protobuf
"

RESTRICT="test"

CMAKE_USE_DIR="${WORKDIR}/${MY_P}/native"

pkg_setup() {
	python_setup
}

src_unpack() {
	default
	# Link kuba-zip submodule (GitHub archive extracts to zip-${KUBA_ZIP_PV}/)
	rmdir "${S}"/native/third-party/zip && ln -sv "${WORKDIR}/zip-${KUBA_ZIP_PV}" "${S}"/native/third-party/zip || die
	# Generate protobuf headers that sp_processor.cc includes via the
	# sentencepiece submodule include path, regenerated for system protobuf.
	local sp_src="${WORKDIR}/sentencepiece-${SP_COMMIT}"
	local sp_dst="${S}"/native/third-party/sentencepiece/src/builtin_pb
	mkdir -p "${sp_dst}" || die
	protoc --proto_path="${sp_src}/src" \
		--cpp_out="${sp_dst}" \
		"${sp_src}/src/sentencepiece_model.proto" || die
}

src_prepare() {
	sed -i 's/ NO_DEFAULT_PATH//g' native/cmake/modules/FindTorch.cmake || die
	# Drop --strip from cmake install so portage handles stripping
	sed -i 's/, "--strip"\]/]/' native/python/setup.py || die
	eapply "${FILESDIR}/${P}-system-fmt.patch"
	eapply "${FILESDIR}/${P}-system-deps.patch"
	eapply "${FILESDIR}/${P}-compile-fixes.patch"
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DFAIRSEQ2N_INSTALL_STANDALONE=OFF
		-DFAIRSEQ2N_USE_CUDA=$(usex cuda)
		-DFAIRSEQ2N_BUILD_PYTHON_BINDINGS=$(usex python)
	)
	use cuda && mycmakeargs+=( -DCMAKE_CUDA_ARCHITECTURES=native )
	if has_version ">=dev-cpp/abseil-cpp-20260107.0"; then
		mycmakeargs+=( -DCMAKE_CXX_STANDARD=20 )
	fi
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install

	if use python; then
		# setup.py's install_cmake looks for the cmake build at "../build"
		# relative to native/python/; symlink that to the real BUILD_DIR.
		ln -sf "${BUILD_DIR}" "${S}/native/build" || die
		cd "${S}/native/python" || die
		"${EPYTHON}" setup.py install \
			--root="${D}" \
			--prefix="${EPREFIX}/usr" \
			--no-compile || die
		# Remove old-style egg-info (portage manages package metadata)
		rm -rf "${D}$(python_get_sitedir)"/fairseq2n*.egg-info || die
		# Generate bytecode that --no-compile skipped
		python_optimize "${D}$(python_get_sitedir)/fairseq2n"
	fi
}
