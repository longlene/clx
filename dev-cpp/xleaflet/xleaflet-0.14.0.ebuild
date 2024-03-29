# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ backend for the jupyter leaflet widget"
HOMEPAGE="https://github.com/QuantStack/xleaflet"
SRC_URI="https://github.com/QuantStack/xleaflet/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	=dev-cpp/xwidgets-0.25.0
	>=dev-cpp/xeus-1.0.0
	>=dev-cpp/xtensor-0.23.8
"
RDEPEND="${DEPEND}"
