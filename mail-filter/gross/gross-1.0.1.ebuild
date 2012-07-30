# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

DESCRIPTION="Greylisting server supporting Sun Java System Messaging Server, Postfix, Sendmail and Exim"
HOMEPAGE="http://code.google.com/p/gross/"
SRC_URI="http://gross.googlecode.com/files/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="net-dns/c-ares"

src_install(){
   emake install DESTDIR=${D} || die "Installation failed."
}
