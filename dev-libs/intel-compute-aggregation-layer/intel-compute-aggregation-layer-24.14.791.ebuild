# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Compute Aggregation Layer for oneAPI Level Zero and OpenCL(TM) Applications"
HOMEPAGE="https://github.com/intel/compute-aggregation-layer?tab=readme-ov-file"
SRC_URI="https://github.com/intel/compute-aggregation-layer/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
S="${WORKDIR}"/compute-aggregation-layer-${PV}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}"/disable-test.patch
)
