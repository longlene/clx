# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A C++ API to Vega-Lite"
HOMEPAGE="https://github.com/Quantstack/xvega"
SRC_URI="https://github.com/QuantStack/xvega/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-cpp/xtl-0.7.0
	>=dev-cpp/nlohmann_json-3.11.3
	>=dev-cpp/xproperty-0.12.0
"
BDEPEND=""
