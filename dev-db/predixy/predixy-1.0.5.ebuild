# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A high performance and fully featured proxy for redis"
HOMEPAGE="https://github.com/joyieldInc/predixy"
SRC_URI="https://github.com/joyieldInc/predixy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin src/predixy
	insinto /etc/predixy
	doins conf/{auth,cluster,command,dc,latency,predixy,sentinel,standalone,try}.conf
	dodoc README.md
}
