# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
CMAKE_VERBOSE=1

inherit cmake-utils

DESCRIPTION="A flexible OpenVPN authentication and access control plug-in"
HOMEPAGE="http://www.eurephia.net/"
SRC_URI="mirror://sourceforge/eurephia/${P}.tar.bz2
	 http://svn.openvpn.net/projects/openvpn/branches/BETA21/openvpn/openvpn-plugin.h"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="eurephiadm eurephiainit"

DEPEND=">=dev-util/cmake-2.6.1
	>=dev-util/pkgconfig-0.21
	>=net-misc/openvpn-2.1
	>=dev-db/sqlite-3.6.23
	eurephiadm? ( >=dev-libs/libxml2-2.6.32
		     >=dev-libs/libxslt-1.1.24
		     >=dev-libs/openssl-0.9.8 )"
RDEPEND="${DEPEND}"

src_unpack() {
	tar xjf ${DISTDIR}/${P}.tar.bz2 || die "failed to unpack ${P}.tar.bz2"
	ebegin "Adding openvpn-plugin.h to the eurephia source code"
	cp ${DISTDIR}/openvpn-plugin.h ${P}/ || die "failed to add openvpn-plugin.h to ${P}"
}

src_prepare() {
	local myconf="--prefix /usr --plug-in --openvpn-src . --fw-iptables"
	myconf="${myconf} --db-sqlite3 --sqlite3-path /var/lib/eurephia"
	if use eurephiadm ; then
		myconf="${myconf} --eurephiadm --eurephiadm-xslt /usr/share/eurephia/xslt/eurephiadm"
	fi
	econf ${myconf}
}

src_compile() {
	cmake-utils_src_make -j1
}

src_install() {
	cmake-utils_src_install
	dodoc LICENSE.txt CREDITS.txt
	if use eurephiainit; then
		ebegin "Installing eurephia_init"
		exeinto /usr/sbin
		exeopts -m0700
		doexe utils/eurephia_init
		insinto /usr/share/man/man7
		doins utils/eurephia_init.7
		eend 0
	fi
}
