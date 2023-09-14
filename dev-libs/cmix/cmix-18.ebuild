# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
HOMEPAGE="https://github.com/byronknoll/cmix"
SRC_URI="https://github.com/byronknoll/cmix/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i 's/clang++/$(CXX)/' makefile
}

src_install() {
	dobin cmix
	dodoc README
}
