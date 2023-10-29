# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A better c++filt"
HOMEPAGE="https://github.com/nico/demumble"
SRC_URI="https://github.com/nico/demumble/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${BUILD_DIR}/${PN}
	dodoc README.md
}
