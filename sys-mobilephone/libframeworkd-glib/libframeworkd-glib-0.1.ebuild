# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2 autotools

DESCRIPTION="Glib bindings for Freesmarphone Framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/libframeworkd-glib.git"
EGIT_TREE="2ffa862179bded1d98ca81c08efa55b8aeed8d4d"
EGIT_PROJECT="libframeworkd-glib"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

RDEPEND="${DEPEND}"
DEPEND="dev-libs/dbus-glib"

src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack

	cd "${S}"
	eautoreconf || die "autoreconf failed"
	glib-gettextize --force --copy || die "glib-gettextize failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake failed"
}
