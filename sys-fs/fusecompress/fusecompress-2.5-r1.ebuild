# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit git

DESCRIPTION="Comressed FUSE implementation"
HOMEPAGE="http://www.miio.net/fusecompress/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/tex/fusecompress.git"
EGIT_TREE="6495b137ef543ff4b73d9fdd14d41c8a53486569"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bzip2 lzma lzo zlib"

RDEPEND="
	>=dev-libs/boost-1.33.1
	bzip2? ( app-arch/bzip2 )
	lzma? ( >=app-arch/lzma-utils-4.999 )
	lzo? ( >=dev-libs/lzo-2 )
	zlib? ( sys-libs/zlib )
"
DEPEND="${RDEPEND}"

src_compile() {
	econf \
		$(use_with bzip2 bz2) \
		$(use_with lzma) \
		$(use_with lzo lzo2) \
		$(use_with zlib z)
	emake || die "Compilation failed"
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc ChangeLog README
}
