# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI="2"

inherit distutils eutils

DESCRIPTION="GTK+ 2 rewrite of a well-known GTK+ 1 tool LinNeighborhood"
HOMEPAGE="https://launchpad.net/pyneighborhood"
SRC_URI="http://launchpad.net/pyneighborhood/0.5/0.5.4/+download/${P}.tar.bz2"
IUSE=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"

RDEPEND=">=dev-lang/python-2.5 
         net-fs/samba
         dev-python/pygtk"

src_prepare() {
	epatch "${FILESDIR}/${PN}-0.5.4-datafiles.patch"
}

