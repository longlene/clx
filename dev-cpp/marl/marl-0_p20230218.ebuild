# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="2e82e6999f4947cb2d682dd1b8c636928397c578"

DESCRIPTION="A hybrid thread / fiber task scheduler"
HOMEPAGE="https://github.com/google/marl"
SRC_URI="https://github.com/google/marl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dolib.so ${BUILD_DIR}/libmarl.so*
	insinto /usr/include
	doins -r include/marl
	dodoc README.md
}
