# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="1e00e79b6ef2c2304eca6d05ef50242f4551e35d"

DESCRIPTION="Reflang - Modern C++ reflection using libclang"
HOMEPAGE="https://github.com/chakaz/reflang"
SRC_URI="https://github.com/chakaz/reflang/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/clang
"
RDEPEND="${DEPEND}"

src_install() {
	dobin ${BUILD_DIR}/reflang
	dodoc README.md
}
