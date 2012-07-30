# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A union filesystem for FUSE."
HOMEPAGE="http://funionfs.apiou.org/"
SRC_URI="http://funionfs.apiou.org/file/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=">=sys-fs/fuse-2.5.0"
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die "make install failed!"
}
