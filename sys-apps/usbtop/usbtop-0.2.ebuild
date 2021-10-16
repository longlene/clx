# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="usbtop is a top-like utility that shows an estimated instantaneous bandwidth on USB buses and devices"
HOMEPAGE="https://github.com/aguinet/usbtop"
SRC_URI="https://github.com/aguinet/usbtop/archive/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
	net-libs/libpcap
"
RDEPEND="${DEPEND}"
