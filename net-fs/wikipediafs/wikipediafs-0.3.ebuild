# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=5
inherit distutils

DESCRIPTION="FUSE filesystem that lets you view and edit Wikipedia articles as if they were real files"
HOMEPAGE="http://wikipediafs.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

RDEPEND="sys-fs/fuse-python"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
	cp -r example ${D}/usr/share/doc/${PF}/
}
