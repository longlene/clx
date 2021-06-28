# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Jupyter kernel for SQLite"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-sqlite"
SRC_URI="https://github.com/jupyter-xeus/xeus-sqlite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-cpp/xeus-1.0.0
	dev-db/sqlite
	>=dev-cpp/sqlitecpp-3.0.0
	>=dev-cpp/tabulate-1.3.0
	>=dev-cpp/nlohmann_json-3.0.0
	>=dev-cpp/xvgea-0.0.10
"
RDEPEND="${DEPEND}"
BDEPEND=""
