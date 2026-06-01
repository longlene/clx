# Copyright 2007-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="GIMP plugin to generate large textures from a small sample"
HOMEPAGE="http://gimp-texturize.sourceforge.net/"
SRC_URI="mirror://sourceforge/gimp-texturize/texturize-${PV}_src.tgz"

LICENSE="GPL-2"
SLOT="0"
S="$WORKDIR/gimp-texturize"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=media-gfx/gimp-2.3"
DEPEND="${RDEPEND}"

src_install() {
	make DESTDIR="${D}" install

	dodoc AUTHORS bugs ChangeLog COPYING NEWS README todo
}
