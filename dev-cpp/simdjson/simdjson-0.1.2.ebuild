# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Parsing gigabytes of JSON per second"
HOMEPAGE="https://github.com/lemire/simdjson"
SRC_URI="https://github.com/lemire/simdjson/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i "/install/{s#lib#$(get_libdir)#}" src/CMakeLists.txt
}
