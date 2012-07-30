# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

DESCRIPTION="split tcp requests of different type to different servers"
HOMEPAGE="http://ypd.berlios.de"
SRC_URI=""
EGIT_REPO_URI="git://repo.or.cz/ypd.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	dobin src/ypd
	dodir /etc/init.d/
	newinitd "${FILESDIR}/ypd.rc" ypd
	newconfd "${FILESDIR}/ypd.conf" ypd
	dodoc README ChangeLog AUTHORS
}

