# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

MY_PV=${PV/./_}

DESCRIPTION="Open source SDR LTE software suite from Software Radio Systems"
HOMEPAGE="http://www.softwareradiosystems.com"
SRC_URI="https://github.com/srsLTE/srsLTE/archive/release_${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	dev-libs/libconfig
	net-misc/lksctp-tools
	net-libs/mbedtls
	sci-libs/fftw
"
RDEPEND="${DEPEND}"
BDEPEND=""
