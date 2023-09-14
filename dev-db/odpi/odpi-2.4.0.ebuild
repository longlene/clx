# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Oracle Database Programming Interface for Drivers and Applications"
HOMEPAGE="https://github.com/oracle/odpi"
SRC_URI="https://github.com/oracle/odpi/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/oracle-instantclient
"

src_install() {
	dolib.so lib/libodpic.so*
	insinto /usr/include
	doins include/dpi.h
	dodoc README.md
}
