# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Kaldi-compatible online feature extraction (fbank/MFCC) using kissfft"
HOMEPAGE="https://github.com/csukuangfj/kaldi-native-fbank"
SRC_URI="https://github.com/csukuangfj/kaldi-native-fbank/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sci-libs/kissfft"
RDEPEND="${DEPEND}"

PATCHES=( "${FILESDIR}/${P}-system-kissfft.patch" )

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DKALDI_NATIVE_FBANK_BUILD_PYTHON=OFF
		-DKALDI_NATIVE_FBANK_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
