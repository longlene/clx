# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils

DESCRIPTION="A C library for creating Excel XLSX files"
HOMEPAGE="https://libxlsxwriter.github.io"
SRC_URI="https://github.com/jmcnamara/libxlsxwriter/archive/RELEASE_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
#KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
sys-libs/zlib[minizip]
"

S="${WORKDIR}"/${PN}-RELEASE_${PV}

src_prepare() {
	epatch "${FILESDIR}"/funtoo-make-fixes-${PV}.patch || die "patch failed"
}

src_install() {
	insinto /usr/include
	doins -r include/*
	dolib.so lib/libxlsxwriter.so
	dodoc Readme.md
}
