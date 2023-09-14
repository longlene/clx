# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Bitcoin Cross-Platform C++ Development Toolkit"
HOMEPAGE="https://github.com/libbitcoin/libbitcoin"
SRC_URI="https://github.com/libbitcoin/libbitcoin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	dev-libs/libsecp256k1
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}

