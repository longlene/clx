# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ GPIO Library for Linux"
HOMEPAGE="https://github.com/dimitry-ishenko-cpp/gpio"
SRC_URI="https://github.com/dimitry-ishenko-cpp/gpio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/asio
"
RDEPEND="${DEPEND}"
BDEPEND=""
