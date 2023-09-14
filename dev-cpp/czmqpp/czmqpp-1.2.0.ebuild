# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit autotools

DESCRIPTION="C++ wrapper for czmq"
HOMEPAGE="https://github.com/zeromq/czmqpp"
SRC_URI="https://github.com/zeromq/czmqpp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-libs/czmq
"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	eautoreconf
}
