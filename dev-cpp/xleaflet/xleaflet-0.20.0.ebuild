# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ backend for the jupyter leaflet widget"
HOMEPAGE="https://github.com/jupyter-xeus/xleaflet"
SRC_URI="https://github.com/jupyter-xeus/xleaflet/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xeus-1.0.0
	>=dev-cpp/xproperty-0.12.1
	>=dev-cpp/xwidgets-0.29.2
	>=dev-cpp/xtensor-0.27.1
"
RDEPEND="${DEPEND}"
