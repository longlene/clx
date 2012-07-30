# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="extended_blist_sort-${PV}"

DESCRIPTION="Pidgin plugin that provides several new sort options for the buddy list."
HOMEPAGE="http://freakazoid.teamblind.de/2008/12/13/pidgin-extended-buddy-list-sort-plugin/"
SRC_URI="http://freakazoid.teamblind.de/downloads/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="net-im/pidgin"

S=${WORKDIR}/${MY_P}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
