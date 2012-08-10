# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_PN="devkitARM"
DESCRIPTION="DevKitPro toolchain for ARM processors"
HOMEPAGE="http://devkitpro.org/"
SRC_URI="amd64? ( mirror://sourceforge/devkitpro/${MY_PN}_r${PV}-x86_64-linux.tar.bz2 )
	x86? ( mirror://sourceforge/devkitpro/${MY_PN}_r${PV}-i686-linux.tar.bz2 )"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

S=${WORKDIR}/${MY_PN}
RESTRICT="strip"

dir="opt/devkitpro/${MY_PN}"
QA_EXECSTACK="${dir}/lib/gcc/arm-eabi/4.4.3/thumb/*.o
	${dir}/lib/gcc/arm-eabi/4.4.3/*.o
	${dir}/arm-eabi/lib/*.o
	${dir}/libexec/gcc/arm-eabi/4.4.3/cc1*"

src_install() {
	insinto /${dir}
	insopts -m0755
	doins -r * || die

	doenvd "${FILESDIR}"/99devkitpro || die
}
