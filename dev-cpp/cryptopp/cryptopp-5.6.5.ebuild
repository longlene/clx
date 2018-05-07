# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

MY_PV=${PV//./_}

DESCRIPTION="C++ class library of cryptographic schemes"
HOMEPAGE="https://www.cryptopp.com/"
SRC_URI="https://github.com/weidai11/cryptopp/archive/CRYPTOPP_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="static-libs"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DBUILD_STATIC=$(usex static-libs)
	-DBUILD_TESTING=OFF
	)
	cmake-utils_src_configure
}

