# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hermes JS Engine"
HOMEPAGE="https://hermesengine.dev/"
SRC_URI="https://github.com/facebook/hermes/archive/refs/tags/hermes-v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/hermes-hermes-v${PV}
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/python
"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i API/hermes/CMakeLists.txt
	cmake_src_prepare
}
