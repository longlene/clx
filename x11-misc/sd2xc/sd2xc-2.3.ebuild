# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="CursorXP to X11 Mouse Theme Converter"
HOMEPAGE="http://xfce-look.org/content/download.php?content=72405&id=1&tan=46400477"
SRC_URI="http://www.infinality.net/files/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="dev-lang/perl
	media-gfx/imagemagick
	x11-apps/xcursorgen
	app-arch/unzip
	dev-perl/Config-IniFiles"

S="${WORKDIR}"

pkg_preinst() {
	if ! built_with_use media-gfx/imagemagick perl ; then 
	        eerror "You MUST re-emerge media-gfx/imagemagick with perl support"
	fi
}

src_compile() {
	einfo "nothing to compile"
}

src_install() {
	newbin sd2xc-2.3.pl sd2xc
}
