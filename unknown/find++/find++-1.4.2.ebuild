# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A small but very useful tool to find files on your system"
HOMEPAGE="http://www.ios-software.com/?page=projet&quoi=15"
SRC_URI="http://www.ios-software.com/find++/find++-1.4.2.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"

IUSE=""
DEPEND=">=x11-libs/gtk+-1.2.10-r10
	sys-apps/slocate"
S=${WORKDIR}/${P}

MY_P="find++"
MY_S=${WORKDIR}/${MY_P}

src_unpack() {
	unpack ${A}
	cd ${S}

}
src_install() {
	cat {D}
	make DESTDIR=${D} install || die "install failed"
}