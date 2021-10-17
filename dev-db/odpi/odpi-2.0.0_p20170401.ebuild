# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="27ffebd41f6295aad2906bd2ad7705bc087f3b18"

DESCRIPTION="Oracle Database Programming Interface for Drivers and Applications"
HOMEPAGE="https://github.com/oracle/odpi"
SRC_URI="https://github.com/oracle/odpi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/oracle-instantclient
"

src_install() {
	dolib.so lib/libodpic.so
	insinto /usr/include
	doins include/dpi.h
	dodoc README.md
}
