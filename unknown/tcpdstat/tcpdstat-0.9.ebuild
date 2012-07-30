# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Tool for getting a high-level view of traffic patterns for a given libpcap file."
HOMEPAGE="http://staff.washington.edu/dittrich/talks/core02/tools/tools.html"
SRC_URI="http://staff.washington.edu/dittrich/talks/core02/tools/tcpdstat-uw.tar"

LICENSE="BSD"
SLOT="0"
KEYWORDS="x86"
IUSE=""

RDEPEND="net-libs/libpcap"

DEPEND="${RDEPEND}"

DOCS="README.uw"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${PN}-fix_static_declaration.patch 
	epatch ${FILESDIR}/${PN}-fix_makefile_install.patch
}

src_compile() {
	_src_dir=${WORKDIR}/${PN}-uw
	cd ${_src_dir}
	emake || die "Make failed"
}

src_install() {
	_src_dir=${WORKDIR}/${PN}-uw
	cd ${_src_dir}
	make install PREFIX="${D}" || die "Install failed"
	dodoc README.uw
}

