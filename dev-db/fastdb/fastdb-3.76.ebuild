# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Main Memory Relational Database Management System"
HOMEPAGE="http://www.garret.ru/fastdb.html"
SRC_URI="http://www.garret.ru/fastdb-${PV}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="diskless"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	econf $(use_enable diskless)
}
