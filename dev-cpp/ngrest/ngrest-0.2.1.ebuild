# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Fast and easy C++ RESTful WebServices framework"
HOMEPAGE="https://github.com/loentar/ngrest"
SRC_URI="https://github.com/loentar/ngrest/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	cmake_src_compile -j1
}
