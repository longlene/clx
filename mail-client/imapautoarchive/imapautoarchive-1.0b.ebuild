# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/iftop/iftop-0.17.ebuild,v 1.3 2006/07/13 16:08:55 agriffis Exp $

inherit eutils

DESCRIPTION="automatically move, copy, or delete mail on an imap server based on when it was received"
SRC_URI="http://www.joeshmoe.com/imapautoarchive/${P}.tar.gz"
HOMEPAGE="http://www.joeshmoe.com/imapautoarchive/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 hppa ia64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND="dev-perl/Mail-IMAPClient"

src_unpack() {
        unpack ${A}; cd "${S}"
}

src_install() {
        dobin imapautoarchive.pl

        insinto /etc
        doins imapautoarchive.sample.cfg

        dodoc README
}

