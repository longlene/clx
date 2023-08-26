# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ implementation of a fast hash map and hash set using hopscotch hashing"
HOMEPAGE="https://github.com/Tessil/hopscotch-map"
SRC_URI="https://github.com/Tessil/hopscotch-map/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
