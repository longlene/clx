# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
DESCRIPTION="Allows streaming video from a hacked TiVo running vserver"
HOMEPAGE="http://armory.nicewarrior.org/projects/vstream-client/"
SRC_URI="http://armory.nicewarrior.org/mirror.php?path=vstream-client/${P}.tar.gz&mirror=download -> ${P}.tar.gz"

# License needs too be confirmed. (was forked from tivo-mplayer project
# which was forked from mplayer which is licensed under GPL-2...)
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_configure() {
	./configure --prefix=/usr
}

src_compile() {
	emake || die "Failed to build vstream-client!"
}

src_install() {
	dolib libvstream-client.a
	dobin vstream-client
	insinto /usr/include/
	doins vstream-client.h
}
