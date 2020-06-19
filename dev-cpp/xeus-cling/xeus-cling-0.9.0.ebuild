# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Jupyter Kernel for C++ based on xeus and cling"
HOMEPAGE="https://github.com/quantstack/xeus-cling"
SRC_URI="https://github.com/QuantStack/xeus-cling/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xeus-0.19.1
	>=dev-cpp/xtl-0.6.1
	>=sys-devel/cling-0.5
	>=dev-libs/pugixml-1.8.1
	>=net-libs/cppzmq-4.3.0
	>=dev-cpp/cxxopts-2.1.1
	>=dev-cpp/nlohmann_json-3.3.0
"
RDEPEND="${DEPEND}"
