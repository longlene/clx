# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="37ae48f403ca0c98f6731db2923f89bb0b96518a"

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
