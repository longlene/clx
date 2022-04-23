# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Hermes JS Engine"
HOMEPAGE="https://hermesengine.dev/"
SRC_URI="https://github.com/facebook/hermes/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/python
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e "s#DESTINATION lib#DESTINATION $(get_libdir)#" -i API/hermes/CMakeLists.txt
}
