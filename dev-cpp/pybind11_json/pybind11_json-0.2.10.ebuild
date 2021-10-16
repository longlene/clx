# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Using nlohmann::json with pybind11"
HOMEPAGE="https://github.com/pybind/pybind11_json"
SRC_URI="https://github.com/pybind/pybind11_json/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-python/pybind11
	dev-cpp/nlohmann_json
"
RDEPEND="${DEPEND}"
BDEPEND=""
