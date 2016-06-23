# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="C implementation of the Raft Consensus protocol"
HOMEPAGE="https://github.com/willemt/raft"
SRC_URI="https://github.com/willemt/raft/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr
	doins -r include
	dolib.a libcraft.a
	dolib.so libcraft.so
	dodoc README.rst
}
