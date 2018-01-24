# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a fast and light-weighted key-value store library"
HOMEPAGE="https://github.com/chxdeng/mabain"
SRC_URI="https://github.com/chxdeng/mabain/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include/mabain
	doins src/{db,mb_data,mabain_consts,lock,error}.h
	dolib.so src/libmabain.so
	dobin binaries/mbc
	dodoc README.md
}
