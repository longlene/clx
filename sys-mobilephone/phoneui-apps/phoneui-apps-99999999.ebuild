# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-r3 autotools

DESCRIPTION=""
HOMEPAGE=""

EGIT_REPO_URI="http://shr.bearstech.com/repo/${PN}.git"

EGIT_PROJECT="${PN}"

LICENSE="GPL-3"
SLOT="0"
EAPI="2"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

DEPEND=""
RDEPEND=""

src_prepare() {
	eautoreconf
}

src_install() {
	emake DESTDIR="${D}" install || die
}
