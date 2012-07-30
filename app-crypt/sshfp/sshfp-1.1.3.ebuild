# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="sshfp generates DNS SSHFP records from SSH public keys"
HOMEPAGE="http://www.xelerance.com/software/sshfp/"
SRC_URI="http://www.xelerance.com/software/sshfp/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/dnspython"
RDEPEND=""

src_install() {
	DESTDIR=${D} einstall || die
}
