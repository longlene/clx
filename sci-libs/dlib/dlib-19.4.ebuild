# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Numerical and networking C++ library"
HOMEPAGE="http://dlib.net/"
SRC_URI="https://github.com/davisking/dlib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="blas cuda doc examples fftw gif jpeg lapack mkl png sqlite test X"

RDEPEND="
	blas? ( virtual/blas )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	fftw? ( sci-libs/fftw )
	gif? ( media-libs/giflib )
	jpeg? ( virtual/jpeg:0= )
	lapack? ( virtual/lapack )
	mkl? ( sci-libs/mkl )
	png? ( media-libs/libpng:0= )
	sqlite? ( dev-db/sqlite )
	X? ( x11-libs/libX11 )"
DEPEND="test? ( ${RDEPEND} )"

src_configure() {
	local mycmakeargs=(
	-DDLIB_GIF_SUPPORT=$(usex gif)
	-DDLIB_JPEG_SUPPORT=$(usex jpeg)
	-DDLIB_PNG_SUPPORT=$(usex png)
	-DDLIB_USE_BLAS=$(usex blas)
	-DDLIB_USE_CUDA=$(usex cuda)
	-DDLIB_USE_LAPACK=$(usex lapack)
	-DDLIB_USE_MKL_FFT=$(usex mkl)
	-DDLIB_LINK_WITH_SQLITE3=$(usex sqlite)
	-DDLIB_USE_FFTW=$(usex fftw)
	-DDLIB_NO_GUI_SUPPORT=$(! usex X)
	)
	cmake-utils_src_configure
}
