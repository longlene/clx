# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="VoltDB C++ wireprotocol and client implementation"
HOMEPAGE="https://github.com/VoltDB/voltdb-client-cpp"
SRC_URI="https://github.com/VoltDB/voltdb-client-cpp/archive/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost[threads]
	dev-libs/libevent
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/BOOST_LIBS=/{s#local/##}' makefile
}

src_compile() {
	emake THIRD_PARTY_LIBS=$(pkg-config --libs libevent) libvoltdbcpp.so
}

src_install() {
	dolib.so libvoltdbcpp.so
	insinto /usr/include
	doins -r include/{ttmath,*.hpp,*.h}
	dodoc README.md
}
