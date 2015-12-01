# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit versionator

MY_P=${PN}-$(replace_all_version_separators '-')
DESCRIPTION="A simple, lightweight tool for sniping ebay auctions"
HOMEPAGE="http://esniper.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tgz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-misc/curl-7.20[ssl]" 
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install || die "install failed"
	dobin frontends/snipe || die
	dodoc README NEWS TODO AUTHORS sample_auction.txt sample_config.txt || die
}

pkg_postinst() {
	elog
	elog "Please find a sample config at /usr/share/doc/${P}/sample_config.txt.bz2"
	elog
}
