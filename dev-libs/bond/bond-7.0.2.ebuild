# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Bond is a cross-platform framework for working with schematized data"
HOMEPAGE="https://github.com/Microsoft/bond"
SRC_URI="https://github.com/Microsoft/bond/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="grpc"

DEPEND="
	dev-libs/boost
	|| ( dev-haskell/stack dev-haskell/stack-bin )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBOND_ENABLE_GRPC=$(usex grpc)
	)
	cmake_src_configure
}
