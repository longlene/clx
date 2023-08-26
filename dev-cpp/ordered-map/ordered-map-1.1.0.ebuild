# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ hash map and hash set which preserve the order of insertion"
HOMEPAGE="https://github.com/Tessil/ordered-map"
SRC_URI="https://github.com/Tessil/ordered-map/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
