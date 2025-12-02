# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="xeus-sql is a Jupyter kernel for general SQL implementations"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-sql"
SRC_URI="https://github.com/jupyter-xeus/xeus-sql/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-cpp/xeus-cpp-3.1.1
	>=dev-cpp/tabulate-1.4
	>=dev-cpp/nlohmann_json-3.12.0
	>=dev-cpp/xproperty-0.12.1
	>=dev-cpp/xvega-0.1.1
	>=dev-db/soci-4.0.1
"
RDEPEND="${DEPEND}"
BDEPEND=""
