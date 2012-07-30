# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs eutils

DESCRIPTION="A free Open Source test tool and traffic generator for the SIP protocol"
HOMEPAGE="http://sipp.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/3.2/sipp.svn.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="debug gsl pcap ssl"

DEPEND="sys-libs/ncurses
		gsl? ( sci-libs/gsl )
		pcap? ( net-libs/libpcap
				net-libs/libnet )
		ssl? ( dev-libs/openssl )"

S="${WORKDIR}/${PN}.svn"

src_unpack() {
	unpack ${A}
	cd "${S}"

	local incdir="-I."
	local extracflags="${CFLAGS}"
	local extracppflags="${CXXFLAGS}"
	local extralibs=""
	local debugflags=""

	if use ssl; then
		incdir+=" -I/usr/include/openssl"
	fi

	if use gsl; then
		extracflags+=" -DHAVE_GSL"
		extracppflags+=" -DHAVE_GSL"
		extralibs+=" -lgsl -lgslcblas"
	fi

	if use debug; then
		debugflags+=" -g -pg"
	fi

	cat << EOLOCALMK >> local.mk
CC_linux=$(tc-getCC)
CPP_linux=$(tc-getCXX)
CCLINK_linux=$(tc-getCC)
INCDIR_linux=${incdir}
EXTRACFLAGS=${extracflags}
EXTRACPPFLAGS=${extracppflags}
EXTRALIBS=${extralibs}
DEBUG_FLAGS=${debugflags}
EOLOCALMK
}

src_compile() {
	local makeopt

	use pcap && makeopt="pcapplay"
	use ssl && makeopt="${makeopt:+${makeopt}_}ossl"

	emake ${makeopt} || die "make failed"
}

src_install() {
	dobin sipp
	dodoc *.txt sipp.dtd
	if use pcap; then
		insinto /usr/share/${PN}/pcap
		doins "${S}"/pcap/*pcap
	fi
}
