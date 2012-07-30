# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="mausezahn is a free fast traffic generator written in C"
HOMEPAGE="http://www.perihel.at/sec/mz/"
SRC_URI="http://www.perihel.at/sec/mz/mz-0.40.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/libpcap
	net-libs/libnet
	dev-util/cmake
	dev-libs/libcli"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
}

src_compile() {
	cd "${S}"
	cmake-utils_src_configure
	cmake-utils_src_compile
#	emake || die "econf failed"
}

src_install() {
	cmake-utils_src_install
#    emake DESTDIR="${D}" install || die "make install failed"
}

