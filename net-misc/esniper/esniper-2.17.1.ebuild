# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_P=${PN}-$(replace_all_version_separators '-')
DESCRIPTION="A simple, lightweight tool for sniping ebay auctions."
HOMEPAGE="http://esniper.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tgz"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
DEPEND="dev-libs/openssl
		>=net-misc/curl-7.12"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dodoc README NEWS TODO AUTHORS sample_auction.txt sample_config.txt
}

pkg_postinst() {
	elog
	elog "Please find a sample config at /usr/share/doc/${P}/sample_config.txt.bz2"
	elog
}
	
