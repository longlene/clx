# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit vcs-snapshot

DESCRIPTION="xredis-server is a redis server framework library write by C++"
HOMEPAGE="https://github.com/0xsky/xredis-server"
SRC_URI="https://github.com/0xsky/xredis-server/archive/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
#KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libevent"
RDEPEND="${DEPEND}"

src_install() {
	dolib.so libxredis_server.so
	use static-libs && dolib.a libxredis_server.a
	insinto /usr/include
	doins src/xRedisServerLib.h
	# TODO sds header file
	dodoc README.md
}
