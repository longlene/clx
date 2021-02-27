# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="e82d1a7b8bca94cca68e0000e866289e2cf29ccc"

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
	dolib.a ${BUILD_DIR}/libmarl.a
	insinto /usr/include
	doins -r include/marl
	dodoc README.md
}
