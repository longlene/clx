# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="Jupyter Kernel for C++ based on xeus and cling"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-cling"
SRC_URI="https://github.com/jupyter-xeus/xeus-cling/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xeus-1.0.0
	>=dev-cpp/xtl-0.7.0
	>=sys-devel/cling-0.6
	>=dev-libs/pugixml-1.8.1
	>=net-libs/cppzmq-4.3.0
	>=dev-libs/cxxopts-2.1.1
	>=dev-cpp/nlohmann_json-3.6.1
"
RDEPEND="${DEPEND}"
