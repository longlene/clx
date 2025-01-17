# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="fe5a9840045fae49b24e2651e7acb1236e78a2dc"

DESCRIPTION="A C implementation of Amazon Ion"
HOMEPAGE="https://github.com/amzn/ion-c"
SRC_URI="https://github.com/amzn/ion-c/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/ion-c-${EGIT_COMMIT}

src_configure() {
	local mycmakeargs=(
		-DIONC_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
