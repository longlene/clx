# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ backend for Jupyter interactive widgets"
HOMEPAGE="https://github.com/jupyter-xeus/xwidgets"
SRC_URI="https://github.com/jupyter-xeus/xwidgets/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>dev-cpp/widgetsnbextension-3.0.0
	>=dev-cpp/xtl-0.7.0
	>=dev-cpp/xproperty-0.11.0
	>=dev-cpp/xeus-1.0
	>=dev-cpp/nlohmann_json-3.6.1
"
RDEPEND="${DEPEND}"
