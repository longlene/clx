# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="Abstraction Library for Parallel Kernel Acceleration"
HOMEPAGE="https://github.com/alpaka-group/alpaka"
SRC_URI="https://github.com/alpaka-group/alpaka/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
