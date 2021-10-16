# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Enduro/X Middleware Platform for Distributed Transaction Processing"
HOMEPAGE="https://github.com/endurox-dev/endurox"
SRC_URI="https://github.com/endurox-dev/endurox/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="debug doc gpg"

DEPEND="
	doc? ( app-text/asciidoc )
	gpg? ( app-crypt/gpgme )
"
RDEPEND="${DEPEND}"

CMAKE_IN_SOURCE_BUILD=yes

src_prepare() {
	default
	sed -i '/#\ Install\ bin,\ scripts/,$d' xadmin/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DDEFINE_RELEASEBUILD=$(usex !debug)
	-DNDRX_MEMORY_DEBUG=$(usex debug)
	-DDEFINE_DISABLEGPGME=$(usex !gpg)
	-DDEFINE_DISABLEDOC=$(usex !doc)
	-DDEFINE_DISABLEPSCRIPT=ON
	)
	cmake_src_configure
}
