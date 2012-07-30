# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic git

DESCRIPTION="FuseCompress - compresses filesystem"
HOMEPAGE="http://www.miio.net/fusecompress/"

EGIT_REPO_URI="git://github.com/tex/fusecompress.git"
EGIT_TREE="7a407ebddfe594be2b6921fad36f6502fa4182fc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-fs/fuse
	app-arch/bzip2
	app-arch/gzip
	sys-libs/zlib
	dev-libs/lzo:2
	>=dev-libs/boost-1.33.1-r1
	>=dev-libs/rlog-1.3"
RDEPEND="${DEPEND}"

src_compile() {
	econf --with-boost-serialization=boost_serialization-mt \
	--with-boost-iostreams=boost_iostreams-mt \
	--with-boost-program-options=boost_program_options-mt \
	--with-boost-filesystem=boost_filesystem-mt

	emake || die "Compilation failed"
}

src_install() {
        emake install DESTDIR="${D}" || die "emake install failed"
        dodoc ChangeLog README
}
