# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit multilib toolchain-funcs

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
