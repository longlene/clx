# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Utility to manage devices in escritorio-movistar"
HOMEPAGE="http://open.movilforum.com/node/289"
MY_P="mobile-manager_0.7.orig"
SRC_URI="http://open.movilforum.com/archive/escritorio-movistar/ubuntu/pool/main/m/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/sqlobject"

src_install() {
        emake DESTDIR="${D}" install
}

