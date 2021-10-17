# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

DESCRIPTION="A tiling window manager using space partitioning tree"
HOMEPAGE="https://github.com/aesophor/Wmderland"
SRC_URI="https://github.com/aesophor/Wmderland/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/glog
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""
