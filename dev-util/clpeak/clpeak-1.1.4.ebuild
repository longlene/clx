# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A tool which profiles OpenCL devices to find their peak capacities"
HOMEPAGE="https://github.com/krrishnarraj/clpeak"
SRC_URI="https://github.com/krrishnarraj/clpeak/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	virtual/opencl
"
RDEPEND="${DEPEND}"

#src_install() {
#	dobin ${BUILD_DIR}/clpeak
#	dodoc README.md
#}
