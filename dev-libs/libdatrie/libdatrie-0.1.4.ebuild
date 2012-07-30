# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/iniparser/iniparser-3.0b.ebuild,v 1.2 2008/08/15 15:46:03 dev-zero Exp $

inherit multilib toolchain-funcs eutils

DESCRIPTION="An implementation of double-array trie."
HOMEPAGE="http://linux.thai.net/~thep/datrie/datrie.html"
SRC_URI="ftp://linux.thai.net/pub/ThaiLinux/software/libthai/${P}.tar.gz"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "Installation failed!"
}
