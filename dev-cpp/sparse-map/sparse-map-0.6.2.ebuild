# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ implementation of a memory efficient hash map and hash set"
HOMEPAGE="https://github.com/Tessil/sparse-map"
SRC_URI="https://github.com/Tessil/sparse-map/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
