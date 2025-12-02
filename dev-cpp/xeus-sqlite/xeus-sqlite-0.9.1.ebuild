# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Jupyter kernel for SQLite"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-sqlite"
SRC_URI="https://github.com/jupyter-xeus/xeus-sqlite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-cpp/xeus-zmq-3.0.0
	>=dev-db/sqlite-3.30.1
	>=dev-cpp/sqlitecpp-3.0.0
	>=dev-cpp/tabulate-1.5.0
	>=dev-cpp/nlohmann_json-3.0.0
	>=dev-cpp/xvega-0.0.10
	>=dev-cpp/xvega-bindings-0.0.10
"
RDEPEND="${DEPEND}"
BDEPEND=""
