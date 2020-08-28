# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Traitlets-like C++ properties and implementation of the observer pattern"
HOMEPAGE="https://github.com/QuantStack/xproperty"
SRC_URI="https://github.com/QuantStack/xproperty/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-cpp/xtl-0.5.0
"
RDEPEND="${DEPEND}"
