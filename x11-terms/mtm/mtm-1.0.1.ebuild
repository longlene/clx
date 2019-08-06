# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Perhaps the smallest useful terminal multiplexer in the world"
HOMEPAGE="https://github.com/deadpixi/mtm"
SRC_URI="https://github.com/deadpixi/mtm/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's#FEATURES#C_&##' Makefile
}

src_install() {
	dobin mtm
	doman mtm.1
	dodoc README.rst
}
