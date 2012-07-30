# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git autotools libtool

DESCRIPTION="Synfig: Film-Quality Vector Animation (core engine)"
HOMEPAGE="http://www.synfig.com"
EGIT_REPO_URI="git://synfig.git.sourceforge.net/gitroot/synfig/synfig"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="imagemagick ffmpeg dv openexr truetype jpeg tiff fontconfig nls"

DEPEND=">=dev-libs/libsigc++-2.0.0
	>=dev-cpp/libxmlpp-2.6.1
	media-libs/libpng
	>=dev-cpp/ETL-0.04.13
	ffmpeg? ( media-video/ffmpeg )
	openexr? ( media-libs/openexr )
	truetype? ( >=media-libs/freetype-2.1.9 )
	fontconfig? ( media-libs/fontconfig )
	jpeg? ( media-libs/jpeg )
	tiff? ( media-libs/tiff )
	nls? ( sys-devel/gettext )"

RDEPEND="${DEPEND}
	dv? ( media-libs/libdv )
	imagemagick? ( media-gfx/imagemagick )"

src_unpack() {
	git_src_unpack
	elibtoolize --ltdl --copy --force || die "libtoolize failed"
	eautoreconf --install --force || die "autoreconf failed"
}

src_compile() {
	econf \
		$(use_with ffmpeg) \
		$(use_with fontconfig) \
		$(use_with imagemagick) \
		$(use_with dv libdv) \
		$(use_with openexr ) \
		$(use_with truetype freetype) \
		$(use_with jpeg) \
		|| die "Configure failed!"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed!"
	dodoc doc/*.txt
	insinto /usr/share/${PN}/examples
	doins examples/*.sif
	doins examples/*.sifz
}
