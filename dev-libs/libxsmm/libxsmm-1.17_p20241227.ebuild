# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="ffabf6eaa7547a46a2b191c2bf170470a3fd2c4a"

DESCRIPTION="Library for specialized dense and sparse matrix operations, and deep learning primitives"
HOMEPAGE="https://github.com/libxsmm/libxsmm"
SRC_URI="https://github.com/libxsmm/libxsmm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="mkl"

DEPEND="
	mkl? ( sci-libs/mkl )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}

PATCHES=(
	"${FILESDIR}"/Makefile-fix-pkgconfigdir.patch
)

src_compile() {
	local mkl=0
	use mkl && mkl=1
	emake \
		STATIC=0 \
		MKL=${mkl}
}

src_install() {
	emake \
		DESTDIR="${D}" \
		PREFIX="/usr" \
		OUTDIR=$(get_libdir) \
		SYM=1 \
		install
}
