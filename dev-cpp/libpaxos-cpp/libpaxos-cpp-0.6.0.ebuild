# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="a C++ implementation of the Paxos distributed consensus protocol"
HOMEPAGE="https://github.com/solatis/libpaxos-cpp"
SRC_URI="https://github.com/solatis/libpaxos-cpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-cpp/asio
	dev-db/sqlite
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/AM_INIT_AUTOMAKE/{s/-Werror//}' configure.ac
	eautoreconf
}
