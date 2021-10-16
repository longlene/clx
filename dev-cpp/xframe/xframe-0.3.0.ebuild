# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake

DESCRIPTION="C++ dataframe"
HOMEPAGE="https://github.com/QuantStack/xframe"
SRC_URI="https://github.com/QuantStack/xframe/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xtensor-0.21.4
"
RDEPEND="${DEPEND}"
