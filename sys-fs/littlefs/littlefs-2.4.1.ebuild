# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A little fail-safe filesystem designed for microcontrollers"
HOMEPAGE="https://github.com/ARMmbed/littlefs"
SRC_URI="https://github.com/ARMmbed/littlefs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins lfs.h
	newlib.a lfs.a liblfs.a
	dodoc README.md
}
