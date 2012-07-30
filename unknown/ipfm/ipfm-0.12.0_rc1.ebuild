# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="${P/_/}"
S=${WORKDIR}/${MY_P}

DESCRIPTION="IP Flow Meter (IPFM) is a bandwidth analysis tool"
HOMEPAGE="http://robert.cheramy.net/ipfm/"
SRC_URI="http://robert.cheramy.net/ipfm/archive/${MY_P}.tgz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"

DEPEND="net-libs/libpcap
	sys-devel/bison
	sys-devel/flex"
RDEPEND="net-libs/libpcap"

src_install () {
#	ipfm makefile uses ROOT instead of DESTDIR
	make install ROOT=${D}
	newinitd ${FILESDIR}/ipfm ipfm
        dodoc HISTORY INSTALL TODO
}