# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Initscript for QEmu virtual machines."
HOMEPAGE="http://www.nathanshearer.com/modules/pages/pages/pages.php?pages[display_page][id]=41"
SRC_URI="http://www.nathanshearer.com/modules/core/home/1/QEmu%20Initscript/${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-misc/socat"
RDEPEND="${DEPEND}"

src_install() {
	cp -r * "${D}"
}

src_unpack() {
	unpack "${A}"
}

