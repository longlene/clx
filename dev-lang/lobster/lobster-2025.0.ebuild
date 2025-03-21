# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="The Lobster Programming Language"
HOMEPAGE="https://github.com/aardappel/lobster"
SRC_URI="https://github.com/aardappel/lobster/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/opengl
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/dev

src_configure() {
	local mycmakeargs=(
		-DLOBSTER_ENGINE=OFF
	)
	cmake_src_configure
}
