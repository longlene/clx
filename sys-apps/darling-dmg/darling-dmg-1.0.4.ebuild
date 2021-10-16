# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="FUSE module for .dmg files"
HOMEPAGE="https://github.com/darlinghq/darling-dmg"
SRC_URI="https://github.com/darlinghq/darling-dmg/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -e "/install(TARGETS\ dmg/{s#DESTINATION\ lib#DESTINATION $(get_libdir)#}" -i CMakeLists.txt || die
}
