# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit toolchain-funcs

DESCRIPTION="Sequential video thumbnail generator"
HOMEPAGE="http://moviethumbnail.sf.net/"
SRC_URI="http://downloads.sourceforge.net/moviethumbnail/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-video/ffmpeg
	media-fonts/liberation-fonts
	media-libs/gd"
RDEPEND="${DEPEND}"

src_prepare() {
	# Collision with the standard alphasort
	sed -i -e 's/alphasort/my_&/g' "${S}/src/mtn.c" || die "sed failed"

	# Set a sane font by default
	# (otherwise it silently quits if no font is specified at runtime)
	sed -i -e \
		"s:\(^#define GB_F_FONTNAME\).*$:\1 \"${ROOT}/usr/share/fonts/liberation-fonts/LiberationSans-Regular.ttf\":g" \
		"${S}/src/mtn.c" || die "setting a font failed"
}

src_compile() {
	$(tc-getCC) ${CFLAGS} ${LDFLAGS} -o "${PN}" "${S}/src/mtn.c" \
		-lavcodec -lavformat -lavutil -lswscale -lgd \
		-D_FILE_OFFSET_BITS=64 \
		|| die "Compile failed"
}

src_install() {
	dobin "${PN}" || die "install failed"
	dohtml -r -a html,jpg doc/
	dodoc readme.txt changelog.txt 
}
