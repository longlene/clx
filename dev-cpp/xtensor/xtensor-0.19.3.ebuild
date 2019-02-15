# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Multi-dimensional arrays with broadcasting and lazy computing"
HOMEPAGE="https://github.com/QuantStack/xtensor/"
SRC_URI="https://github.com/QuantStack/xtensor/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xtl-0.5.3
"
RDEPEND="${DEPEND}"
