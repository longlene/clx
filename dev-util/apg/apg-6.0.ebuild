# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit base

DESCRIPTION="ABNF Parser Generator"

HOMEPAGE="http://www.coasttocoastresearch.com/"
SRC_URI="http://www.coasttocoastresearch.com/${P}/${P}.tar.bz2"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="!app-admin/apg"
DEPEND=""

src_install() {
    base_src_install
    rm -Rf "${D}"/usr/share
    dodoc README || die "dodoc failed"
}
