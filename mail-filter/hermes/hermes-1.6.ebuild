# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit autotools

DESCRIPTION="Antispam proxy offering SMTP banner delay, Throttling, Greylisting and DNSBL"
HOMEPAGE="http://www.hermes-project.com"
SRC_URI="http://www.hermes-project.com/files/${P}.tar.bz2"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-db/sqlite"

src_install(){
   emake install DESTDIR=${D} || die "Installation failed."
}
