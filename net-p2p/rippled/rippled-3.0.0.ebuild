# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

SRC_URI="https://github.com/XRPLF/rippled/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE="Debug"
