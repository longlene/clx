# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Diskbased (persistent) hashtable"
HOMEPAGE="https://github.com/luispedro/diskhash"
SRC_URI="https://github.com/luispedro/diskhash/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	emake -C src libdht.so
}

src_install() {
	dolib.so src/libdht.so
	insinto /usr/include
	doins src/diskhash.h{,pp}
	dodoc README.md
}
