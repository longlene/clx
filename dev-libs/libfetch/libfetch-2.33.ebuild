# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="File Transfer Library for URLs"
HOMEPAGE=""
SRC_URI="https://sources.archlinux.org/other/libfetch/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	cp ${FILESDIR}/Makefile Makefile
}

src_install() {
	insinto /usr/include
	doins fetch.h
	dolib.so libfetch.so
	doman fetch.3
}

