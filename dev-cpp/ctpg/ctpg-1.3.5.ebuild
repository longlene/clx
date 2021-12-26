# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Compile Time Parser Generator"
HOMEPAGE="https://github.com/peter-winter/ctpg"
SRC_URI="https://github.com/peter-winter/ctpg/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/catch:0
"
RDEPEND="${DEPEND}"
BDEPEND=""
