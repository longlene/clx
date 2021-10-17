# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="8edab23fbc867adbada21378d65774c670c2aaf9"

DESCRIPTION="A tool which profiles OpenCL devices to find their peak capacities"
HOMEPAGE="https://github.com/krrishnarraj/clpeak"
SRC_URI="https://github.com/krrishnarraj/clpeak/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	virtual/opencl
"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/clpeak
	dodoc README.md
}
