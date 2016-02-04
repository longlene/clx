# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils autotools

DESCRIPTION="Multiplayer game network engine"
HOMEPAGE="http://www.rakkarsoft.com/"
SRC_URI="mirror://sourceforge/raknetjenkinsso/raknet-${PV}.tar.gz"
LICENSE="CCPL-Attribution-NonCommercial-2.5"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc autopatcher rakvoice"

DEPEND="rakvoice? ( media-libs/speex ) 
		autopatcher? ( dev-db/libpq app-arch/bzip2 )
		sys-devel/libtool
		dev-util/pkgconfig"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_compile() {
	econf \
		$(use_enable rakvoice) \
		$(use_enable autopatcher) \
	|| die "econf failed"
	emake || die "emake failed"
}

src_install() {

	emake DESTDIR="${D}" install || die "emake install failed"

	if use doc; then
		dodoc readme.txt

		dohtml Help/*
		
		docinto api_reference
		dohtml Help/Doxygen/html/*
	fi
}
