# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit vcs-snapshot

EGIT_COMMIT="4424e3dcfedc23e74741f9d215b5d4eadf87cc02"

DESCRIPTION=""
HOMEPAGE="https://github.com/intel/parallelstl"
SRC_URI="https://github.com/intel/parallelstl/archive/${EGIT_COMMIT}.tar.gz -> 4{P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-cpp/tbb
"

src_install() {
	insinto /usr/include
	doins -r include/pstl
	dodoc README.md
}
