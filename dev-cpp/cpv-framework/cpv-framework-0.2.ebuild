# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A web framework written in c++ based on seastar framework"
HOMEPAGE="https://github.com/cpv-project/cpv-framework"
SRC_URI="https://github.com/cpv-project/cpv-framework/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/seastar
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="src"
