# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="mlpack: a scalable C++ machine learning library"
HOMEPAGE="https://www.mlpack.org/"
SRC_URI="https://github.com/mlpack/mlpack/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND="
	dev-libs/boost
	sci-libs/armadillo
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBUILD_TESTS=$(usex test)
	)
	cmake_src_configure
}
