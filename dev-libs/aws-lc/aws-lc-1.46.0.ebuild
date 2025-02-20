# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A general-purpose cryptographic library"
HOMEPAGE="https://github.com/aws/aws-lc"
SRC_URI="https://github.com/aws/aws-lc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBUILD_TESTING=OFF
		-DDISABLE_PERL=ON
		-DDISABLE_GO=ON
	)
	cmake_src_configure
}
