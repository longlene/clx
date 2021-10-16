# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Linux port of Apple's open-source concurrency library"
HOMEPAGE="https://github.com/nickhutchinson/libdispatch"
SRC_URI="https://github.com/nickhutchinson/libdispatch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/blocksruntime
	dev-libs/libbsd
	dev-libs/libpwq
"
RDEPEND="${DEPEND}"
