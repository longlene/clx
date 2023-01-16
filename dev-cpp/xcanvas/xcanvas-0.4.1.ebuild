# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ back-end for ipycanvas"
HOMEPAGE="https://github.com/jupyter-xeus/xcanvas"
SRC_URI="https://github.com/jupyter-xeus/xcanvas/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/xtl
	dev-cpp/xproperty
	dev-cpp/xwidgets
"
RDEPEND="${DEPEND}"
BDEPEND=""
