# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The Link Layer Discovery Protocol"
HOMEPAGE="http://openlldp.sourceforge.net"
MY_P=${P/_/}
SRC_URI="http://downloads.sourceforge.net/${PN}/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="libpcap debug"

DEPEND="libpcap? ( net-libs/libpcap )"
RDEPEND=${DEPEND}

src_compile() {
	use libpcap && myconf=" --enable-generic-framer"
	use debug && myconf="${myconf} --enable-efence"

	econf --prefix=/usr/lib/openlldp \
	${myconf} \
	|| die "Error: econf failed!"
	emake || die "emake failed"
}

src_install() {
	#make DESTDIR="${D}" install || die "emake install failed"
	
	dosbin src/lldpd || die
	dodoc README || die
	newinitd "${FILESDIR}"/lldp-initd lldpd
	newconfd "${FILESDIR}"/lldp-confd openlldp
}

pkg_postinst() {
	elog "This is an experimental ebuild. Use with caution."
	elog ""
	!use libpcap && elog "The kernel module \"af_packet\" is needed for this tool to run."
}

