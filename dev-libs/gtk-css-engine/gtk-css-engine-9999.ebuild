# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git eutils

DESCRIPTION="Theme engine with CSS support for the Gtk+ toolkit"
HOMEPAGE="http://git.gnome.org/cgit/gtk-css-engine/"
EGIT_REPO_URI="git://git.gnome.org/gtk-css-engine"
EGIT_PROJECT="gtk-css-engine"
EGIT_BOOTSTRAP="./autogen.sh"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.12"

DEPEND="${RDEPEND}
	dev-libs/libccss
	>=dev-util/intltool-0.31
	>=dev-util/pkgconfig-0.9"

DOCS="AUTHORS ChangeLog NEWS README"

src_configure() {
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install #|| die "install failed"

	#dodoc FAQ NEWS README || die
	#dohtml EXTENDING.html ctags.html
}
