# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils autotools
DESCRIPTION="portable ASS/SSA renderer"
HOMEPAGE="http://asa.diac24.net/"

#the bizarre extension; no, I don't get it either
SNAP="20070222-054023"
SRC_URI="http://asa.diac24.net/snapshots/${PN}-${SNAP}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="sse2 nls"

COMMON_DEPEND=">=media-libs/freetype-2.2.1
>=media-libs/fontconfig-2.2
media-libs/libpng
virtual/libiconv"
DEPEND="${COMMON_DEPEND}
amd64? ( sse2? ( dev-lang/yasm ) )
x86? ( sse2? ( || ( dev-lang/yasm dev-lang/nasm ) ) )
nls? ( >=sys-devel/gettext-0.14.5 )
app-arch/unzip"
RDEPEND="${COMMON_DEPEND}
nls? ( virtual/libintl )"

S="${WORKDIR}"

src_compile() {
	# could we use eautoreconf here?
	sh bootstrap

	# this will get a little bit more complicated if something besides
	# sse2 is thrown into the mix.
	econf \
		$(use_enable sse2 optimize) \
		$(use_enable nls) \
		|| die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
