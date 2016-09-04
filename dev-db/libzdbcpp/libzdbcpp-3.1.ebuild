# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

MY_PV=${PV/./-}

DESCRIPTION="libzdb c++ 11 wrapper"
HOMEPAGE="https://github.com/abc100m/libzdbcpp"
SRC_URI="https://github.com/abc100m/libzdbcpp/archive/release-${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="!dev-db/libzdb"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}-release-${MY_PV}

src_prepare() {
	eapply_user
	eautoreconf
}
