# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="C++ backend for Jupyter interactive widgets"
HOMEPAGE="https://github.com/QuantStack/xwidgets"
SRC_URI="https://github.com/QuantStack/xwidgets/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/xeus
"
RDEPEND="${DEPEND}"
