# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A software for sharing in LAN"
HOMEPAGE="https://github.com/iptux-src/iptux"
SRC_URI="https://github.com/iptux-src/iptux/archive/refs/tags/v0.8.3.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-cpp/glog
	x11-libs/gtk+:3
	dev-libs/jsoncpp
"
RDEPEND="${DEPEND}"
BDEPEND=""
