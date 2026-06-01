# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A fast multi-producer, multi-consumer lock-free concurrent queue for C++11"
HOMEPAGE="https://github.com/cameron314/concurrentqueue"
SRC_URI="https://github.com/cameron314/concurrentqueue/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="${DEPEND}"
