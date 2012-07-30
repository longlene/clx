# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

PSRC="dhcp-forwarder-${PV}"
DESCRIPTION="Forwards DHCP messages between subnets with different sublayer broadcast domains"
HOMEPAGE="http://www.nongnu.org/dhcp-fwd/"
SRC_URI="http://savannah.nongnu.org/download/${P}/${PSRC}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="diet logging"

DEPEND="diet? ( dev-libs/dietlibc )"

S="${WORKDIR}/${PSRC}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

pkg_setup() {
	enewgroup dhcp-fwd
	enewuser dhcp-fwd -1 -1 -1 dhcp-fwd
}

src_compile() {
	local myconf="--target=${CHOST}"

	#prefers dietlibc by default
	if ! use diet ; then
		myconf="${myconf} --disable-dietlibc"
	fi
	
	if use logging ; then
		myconf="${myconf} --enable-logging"
	fi

	econf ${myconf} || die
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install || die 
	newinitd "${FILESDIR}/dhcp-fwd.initd" dhcp-fwd
	newconfd "${FILESDIR}/dhcp-fwd.confd" dhcp-fwd
	insinto /etc
	newins contrib/dhcp-fwd.conf dhcp-fwd.conf
}


