# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="ba1795733e8593c75903663e9e1864de392bfc3a"

DESCRIPTION="CPU INFOrmation library"
HOMEPAGE="https://github.com/Maratyszcza/cpuinfo"
SRC_URI="https://github.com/Maratyszcza/cpuinfo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

#-DCPUINFO_RUNTIME_TYPE=shared
src_configure() {
	local mycmakeargs=(
	-DCPUINFO_LIBRARY_TYPE=shared
	-DCPUINFO_BUILD_UNIT_TESTS=OFF
	-DCPUINFO_BUILD_MOCK_TESTS=OFF
	-DCPUINFO_BUILD_BENCHMARKS=OFF
	)
	cmake-utils_src_configure
}

#src_install() {
#	default
#	dobin ${BUILD_DIR}/{cpu,isa}-info
#}
