# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git autotools

DESCRIPTION="Glib bindings for Freesmartphone Framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/libframeworkd-glib.git"
EGIT_TREE="37b46d8565505c0ec92b921866cd2fd7fe927706"

EGIT_PROJECT="libframeworkd-glib"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

DEPEND=""
RDEPEND="dev-libs/dbus-glib"

src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack

	cd "${S}"
	eautoreconf
	glib-gettextize --force --copy || die
}

src_install() {
	emake DESTDIR="${D}" install || die
}
