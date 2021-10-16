# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake vcs-snapshot

EGIT_COMMIT="49602432d97222eec1e6c8e4f70723c3864c49c1"

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
