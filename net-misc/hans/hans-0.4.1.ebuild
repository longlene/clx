# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-proxy/hans/hans-0.4.1.ebuild$

EAPI="2"

inherit toolchain-funcs

DESCRIPTION="Ping Tunneling client and server (IP over ICMP)"
HOMEPAGE="http://code.gerade.org/hans/"
SRC_URI="mirror://sourceforge/hanstunnel/${P}.tar.gz"

LICENCE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="kernel_FreeBSD kernel_linux"

src_compile() {
	local mytun=

	use kernel_FreeBSD && mytun=tun_dev_freebsd.c
	use kernel_linux && mytun=tun_dev_linux.c

	emake \
		LDFLAGS="${LDFLAGS}" \
		CFLAGS="${CFLAGS}" \
		GCC="$(tc-getCC)" \
		GPP="$(tc-getCXX)" \
		TUN_DEV_FILE=${mytun} \
		|| die "emake failed"
}

src_install() {
	dobin ${PN} || die "install failed"
}
