# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="An Apple Filing Protocol client implemented in FUSE"
HOMEPAGE="http://sourceforge.net/projects/afpfs-ng/"
SRC_URI="mirror://sourceforge/afpfs-ng/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/libgcrypt
	sys-libs/readline
	dev-libs/gmp
	sys-fs/fuse"
RDEPEND="dev-libs/libgcrypt
	sys-libs/readline
	dev-libs/gmp
	sys-fs/fuse"

src_install() {
	dobin cmdline/afpcmd cmdline/afpgetstatus fuse/afpsd mount_afp
	dodoc COPYING AUTHORS ChangeLog docs/README docs/performance docs/FEATURES.txt docs/REPORTING-BUGS.txt
	doman fuse/*.1 cmdline/*.1
}
