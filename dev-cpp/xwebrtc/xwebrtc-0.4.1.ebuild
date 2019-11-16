# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="C++ backend for the jupyter webrtc widget"
HOMEPAGE="https://github.com/QuantStack/xwebrtc"
SRC_URI="https://github.com/QuantStack/xwebrtc/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/xtl
	dev-cpp/xeus
	dev-cpp/xwidgets
	net-libs/cppzmq
"
RDEPEND="${DEPEND}"
BDEPEND=""
