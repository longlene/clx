# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="RSS feed torrent scraper"
HOMEPAGE="http://www.terrysoucy.ca/index.php?/categories/6-myTV"
SRC_URI="http://www.terrysoucy.ca/uploads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	net-p2p/transmission
	dev-perl/XML-RSSLite
	dev-perl/Net-Twitter
"
RDEPEND="${DEPEND}"

src_install () {
	exeinto /usr/sbin
	doexe mytv || die "Install of mytv failed"
	
	# run mytv every hour
	dosym /usr/sbin/mytv /etc/cron.hourly/mytv


	dodoc Changelog README

	insinto /etc
	doins mytv.conf

	dodir /var/cache/mytv

}
