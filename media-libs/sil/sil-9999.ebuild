# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2

DESCRIPTION="Simple Image Library"
HOMEPAGE="https://github.com/polyfox/SIL"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/polyfox/SIL.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	dolib.a ${CMAKE_BUILD_DIR}/libSIL.a
	insinto /usr/include
	doins -r include/sil
	dodoc README.md
}
