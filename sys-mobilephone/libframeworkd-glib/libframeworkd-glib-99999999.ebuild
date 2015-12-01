# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base git-2 autotools

DESCRIPTION="Glib bindings for Freesmartphone Framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/libframeworkd-glib.git"
EGIT_PROJECT="libframeworkd-glib"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"


DEPEND=""
RDEPEND="dev-libs/dbus-glib"

src_prepare() {
	git_src_prepare
	eautoreconf
}
