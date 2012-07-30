# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Packet sampling and analysis framework"
HOMEPAGE="http://como.intel-research.net"
SRC_URI="mirror://sourceforge/como/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"

# These options are for hardware cards
#IUSE="dag sk98"

# snort support doesn't compile :(
#IUSE="snort"

IUSE="netflow"

# build time depends
DEPEND="
	sys-devel/flex
	>=sys-devel/bison-1.875
	net-libs/libpcap
	netflow? ( >=net-analyzer/flow-tools-0.67 )
	"
#	snort?   ( dev-libs/libpcre )

src_unpack() {
	unpack ${A}
	cd ${S}

	# compile modules with -fPIC
	epatch ${FILESDIR}/${PN}-1.0-pic.patch

	# make target for sniffer-list.h real rather than phoney
	# so it doesn't get rebuilt at install time
	epatch ${FILESDIR}/${PN}-1.0-sniffer-list.patch

	# remove PREFIX from como.gmk as it conflicts with bison/flex builds
	epatch ${FILESDIR}/${PN}-1.0-prefix.patch
}

src_compile() {
	rm base/filter-syntax.c
	rm base/filter-lexic.c

	if use netflow ; then
		netflow='SUPPORT_NETFLOW_V5=1'
	else
		netflow=
	fi

#	if use snort ; then
#		snort='ENABLE_SNORT_MODULE=1'
#	else
#		snort=
#	fi

	make \
		$netflow \
		WARNINGS= \
		INST_BINDIR=/usr/bin \
		INST_LIBDIR=/usr/lib/como \
		INST_DATADIR=/var/lib/como \
		INST_MANDIR=/usr/share/man/man1 \
		DEFAULT_CFGFILE=/etc/como/como.conf \
	|| die "make failed"
#		$snort \
}

src_install() {
	make \
		$netflow \
		WARNINGS= \
		INST_BINDIR=${D}/usr/bin \
		INST_LIBDIR=${D}/usr/lib/como \
		INST_DATADIR=${D}/var/lib/como \
		INST_MANDIR=${D}/usr/share/man/man1 \
		DEFAULT_CFGFILE=${D}/etc/como/como.conf \
		install \
	|| die "make failed"
#		$snort \

	dodoc CHANGES DESCRIPTION LICENSE README

	insinto /etc/como
	doins base/example.conf
}
