# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="UDT is a UDP based data transport protocol"
HOMEPAGE="http://udt.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${PN}.sdk.${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/udt4"
MAKEOPTS="${MAKEOPTS} -j1"

src_compile(){
	echo "${S}"
	echo `pwd`
	cd "${S}"

	case ${ARCH} in
		x86)        PLATFORM="IA32";;
		ppc|ppc64)  PLATFORM="POWERPC";;
		amd64)      PLATFORM="AMD64";;
		ia64)       PLATFORM="IA64";;
		*)          die "Architecture ${ARCH} not supported" ;;
	esac

	case ${CHOST} in
		*-freebsd*|*-netbsd*|*-openbsd*|*-dragonfly*)  OSNAME="BSD" ;;
		*-darwin*)                                     OSNAME="OSX" ;;
		*)                                             OSNAME="LINUX" ;;
	esac

	emake os="${OSNAME}" arch="${PLATFORM}" || die 'make failed'
}

src_install(){
	dolib src/libudt.*

	insinto /usr/include
	doins src/udt.h
}
