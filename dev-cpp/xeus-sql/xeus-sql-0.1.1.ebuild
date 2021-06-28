# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="xeus-sql is a Jupyter kernel for general SQL implementations"
HOMEPAGE="https://github.com/jupyter-xeus/xeus-sql"
SRC_URI="https://github.com/jupyter-xeus/xeus-sql/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-cpp/xeus-1.0.0
	>=dev-cpp/tabulate-1.4
	>=dev-db/soci-4.0.1
"
RDEPEND="${DEPEND}"
BDEPEND=""
