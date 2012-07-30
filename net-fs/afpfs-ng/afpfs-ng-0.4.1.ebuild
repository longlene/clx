# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="An Apple Filing Protocol client implemented in FUSE"
HOMEPAGE="http://sourceforge.net/projects/afpfs-ng/"
SRC_URI="mirror://sourceforge/afpfs-ng/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libgcrypt
	dev-libs/gmp
	sys-fs/fuse"
RDEPEND=""

src_install() {
	dobin afp_client
	dobin afpfsd
	dodoc AUTHORS COPYING ChangeLog NEWS TODO
	dohtml docs/README.html
}
