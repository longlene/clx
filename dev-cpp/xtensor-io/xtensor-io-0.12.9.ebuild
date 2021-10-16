# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="xtensor plugin to read and write images, audio files and numpy (compressed) npz"
HOMEPAGE="https://github.com/QuantStack/xtensor-io"
SRC_URI="https://github.com/QuantStack/xtensor-io/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xtensor-0.23.0
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DDOWNLOAD_GBENCHMARK=OFF
	)
	cmake_src_configure
}
