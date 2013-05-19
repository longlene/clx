# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion gnome2

DESCRIPTION="Alternative menu applet for the GNOME panel"
HOMEPAGE="http://beatnik.infogami.com/Gimmie"
SRC_URI=""
ESVN_REPO_URI="http://svn.gnome.org/svn/${PN}/trunk"
S="${WORKDIR}/${PN}"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="-*"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.6
	>=dev-python/pygtk-2.6
	>=dev-python/pygobject-2.6
	>=dev-python/gnome-python-2.10
	>=dev-python/gnome-python-desktop-2.10
	dev-python/gnome-python-extras
	net-libs/libgmail
	>=net-print/libgnomecups-0.2.2"

DEPEND="${DEPEND}
	${RDEPEND}"

ESVN_BOOTSTRAP="autogen.sh"

src_unpack() {
	subversion_fetch     || die "${ESVN}: unknown problem occurred in subversion_fetch."
	subversion_bootstrap || die "${ESVN}: unknown problem occurred in subversion_bootstrap."
}

gnome2_src_configure() {
	return
}
