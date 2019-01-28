# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="724247d321598a50bb9223997c3f297c444228d7"

DESCRIPTION="Principled, lightweight C/C++ PE parser"
HOMEPAGE="https://github.com/trailofbits/pe-parse"
SRC_URI="https://github.com/trailofbits/pe-parse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="static"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/DESTINATION/{s#\"lib#\"$(get_libdir)#}" pe-parser-library/CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
	-DBUILD_SHARED_LIBS=$(usex !static)
	)
	cmake-utils_src_configure
}
