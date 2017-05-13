# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="A modern C++ network library for developing high performance network services in TCP/UDP/HTTP protocols"
HOMEPAGE="https://github.com/Qihoo360/evpp"
SRC_URI="https://github.com/Qihoo360/evpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/glog
	dev-libs/libevent
"
RDEPEND="${DEPEND}"
