# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="Capstone disassembly/disassembler framework"
HOMEPAGE="http://www.capstone-engine.org"
SRC_URI="mirror://github/aquynh/capstone/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	mycamkeflags=(
	$(cmake-utils_use test APSTONE_BUILD_TESTS)
	)
}
