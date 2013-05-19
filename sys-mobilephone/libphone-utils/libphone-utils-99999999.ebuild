# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git autotools

DESCRIPTION="Glib bindings for Freesmartphone Framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="http://shr.bearstech.com/repo/libphone-utils.git"

EGIT_PROJECT="libphone-utils"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"
EAPI="2"

DEPEND=">=dev-libs/glib-2.18.4-r1"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
	glib-gettextize --force --copy || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
