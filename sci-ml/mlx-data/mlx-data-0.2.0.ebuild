# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Universal data loaders for machine learning"
HOMEPAGE="https://github.com/ml-explore/mlx-data"
STB_COMMIT="f0569113c93ad095470c54bf34a17b36646bbbb5"

SRC_URI="
	https://github.com/ml-explore/mlx-data/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/tmaklin/bxzstr/archive/refs/tags/v1.2.3.tar.gz -> bxzstr-1.2.3.gh.tar.gz
	https://github.com/nothings/stb/archive/${STB_COMMIT}.tar.gz -> stb-${STB_COMMIT}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="ffmpeg +jpeg samplerate +sndfile"
RESTRICT="test"

BDEPEND="
	dev-build/cmake
	dev-python/pybind11[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	app-arch/bzip2
	app-arch/xz-utils
	app-arch/zstd
	>=sys-libs/zlib-ng-2.2.0[compat]
	ffmpeg? ( media-video/ffmpeg:= )
	jpeg? ( media-libs/libjpeg-turbo:= )
	samplerate? ( media-libs/libsamplerate:= )
	sndfile? ( media-libs/libsndfile:= )
"
DEPEND="${RDEPEND}"

src_prepare() {
	pushd "${WORKDIR}/bxzstr-1.2.3" || die
	mkdir bxzstr || die
	cp include/* bxzstr/ || die
	patch -p1 < "${S}/cmake/bxzstr-v1.2.3.patch" || die
	popd || die
	distutils-r1_src_prepare
}

python_compile() {
	local cmake_args=(
		"-DFETCHCONTENT_FULLY_DISCONNECTED=ON"
		"-DFETCHCONTENT_SOURCE_DIR_STB=${WORKDIR}/stb-${STB_COMMIT}"
		"-DFETCHCONTENT_SOURCE_DIR_BXZSTR=${WORKDIR}/bxzstr-1.2.3"
	)
	use ffmpeg || cmake_args+=( "-DCMAKE_DISABLE_FIND_PACKAGE_FFMPEG=ON" )
	use jpeg || cmake_args+=(
		"-DCMAKE_DISABLE_FIND_PACKAGE_JPEGTURBO=ON"
		"-DCMAKE_DISABLE_FIND_PACKAGE_JPEG=ON"
	)
	use samplerate || cmake_args+=( "-DCMAKE_DISABLE_FIND_PACKAGE_SampleRate=ON" )
	use sndfile || cmake_args+=( "-DCMAKE_DISABLE_FIND_PACKAGE_SndFile=ON" )
	local -x CMAKE_ARGS="${cmake_args[*]}"
	local -x PYPI_RELEASE=1
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install
	local sitedir="${D}$(python_get_sitedir)"
	rm -rf "${sitedir}/include" "${sitedir}/lib64" "${sitedir}/share" || die
}
