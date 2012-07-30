# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils flag-o-matic

DESCRIPTION="ext3undel is a collection of scripts to help you recover files from
ext2/ext3 file systems"
HOMEPAGE="http://projects.izzysoft.de/trac/ext3undel/"
SRC_URI="http://projects.izzysoft.de/ftp/net/div/izzysoft/ext3undel/index.php?file=${P}.tar.gz;dir=tar"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="app-forensics/foremost
		app-admin/testdisk
	  	app-forensics/sleuthkit"

# Rename the downloaded script file, as it's named badly
src_unpack() {
	mv "${DISTDIR}/index.php?file=${P}.tar.gz;dir=tar" "${DISTDIR}/${P}.tar.gz"
	MY_A="${P}.tar.gz"
	unpack ${MY_A}
}

src_compile() {
	echo "Skipping compilation as its not needed"
}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
}
