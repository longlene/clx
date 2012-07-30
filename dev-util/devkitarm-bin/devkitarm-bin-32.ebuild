# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_ARCH="${ARCH/amd64/x86_64}"

DESCRIPTION="DevKitPro toolchain for ARM processors"
HOMEPAGE="http://devkitpro.org/"
SRC_URI="mirror://sourceforge/devkitpro/devkitARM_r${PV}-${MY_ARCH}-linux.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/devkitARM"
RESTRICT="strip"

dir="/opt/devkitpro/devkitARM"

QA_EXECSTACK="${dir:1}/lib/gcc/arm-eabi/*/thumb/*.o
	${dir:1}/lib/gcc/arm-eabi/*/*.o
	${dir:1}/arm-eabi/lib/*.o
	${dir:1}/libexec/gcc/arm-eabi/*/cc1*"

src_install() {
	insinto "${dir}"
	doins *_rules
	doins -r arm-eabi include lib libexec 

	into "${dir}"
	dobin bin/*

	insinto "${dir}"/share
	doins -r share/gcc-* share/gdb

	doman share/man/man1/*
	#doman share/man/man7/*
	#doinfo share/info/*

	doenvd "${FILESDIR}/99devkitpro"
}

