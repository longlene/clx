# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C++, header-only library for constructing JSON and JSON-like data formats"
HOMEPAGE="http://danielaparker.github.io/jsoncons"
SRC_URI="https://github.com/danielaparker/jsoncons/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DJSONCONS_BUILD_TESTS=OFF
	)
	cmake_src_configure
}
