# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Protocol Buffers with small code size"
HOMEPAGE="https://jpa.kapsi.fi/nanopb/"
SRC_URI="https://github.com/nanopb/nanopb/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}"

CMAKE_IN_SOURCE_BUILD="YES"
