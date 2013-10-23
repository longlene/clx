# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2 autotools

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

RDEPEND="
	x11-libs/evas
	x11-libs/ecore
	media-libs/edje
	x11-libs/elementary"

DEPEND="${RDEPEND}"

src_prepare() {
	autoreconf -v --install
}

src_install() {
	emake DESTDIR="${D}" install || die
}
