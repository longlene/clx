# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Access to 3G Telefonica Movistar of Spain."
HOMEPAGE="http://open.movilforum.com/node/289"
MY_P="escritorio-movistar_6.5.orig"
SRC_URI="http://open.movilforum.com/archive/${PN}/ubuntu/pool/main/e/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 -amd64"
IUSE=""

DEPEND="dev-python/sqlobject
	app-mobilphone/mobile-manager"

src_install() {
        emake DESTDIR="${D}" install
}

