# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Smart pointers for the (GNU) C programming language"
HOMEPAGE="https://snai.pe/c/c-smart-pointers/"
SRC_URI="https://github.com/Snaipe/libcsptr/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DCOVERALLS_UPLOAD=OFF
	-DTESTS=$(usex test)
	)
	cmake_src_configure
}
	
