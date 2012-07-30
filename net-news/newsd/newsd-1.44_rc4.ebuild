# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${PN}-${PV/_/}
DESCRIPTION="Simple NNTP news server"
HOMEPAGE="http://www.easysw.com/~mike/newsd/index.php"
SRC_URI="ftp://ftp.easysw.com/pub/newsd/test/${MY_P}-source.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="sys-apps/groff"
RDEPEND=""

S=${WORKDIR}/${MY_P}

src_install() {
	dodoc ANNOUNCEMENT CHANGES README inn2newsd.sh doc/*
	doman newsd.conf.5 newsd.8
	dosbin newsd
	insinto /etc
	doins newsd.conf
	newinitd ${FILESDIR}/newsd.init newsd	
}
