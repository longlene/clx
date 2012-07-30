# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

inherit gnome2 subversion autotools

DESCRIPTION="Gtkburner is a cd recoder based on GStreamer  and Gtk2 is used for interface"
HOMEPAGE="http://gtkburner.aditel.org/"
SRC_URI=""

MY_PN=${PN/-svn}
ESVN_REPO_URI="svn://aditel.org/svn/${MY_PN}/${MY_PN}"
ESVN_PROJECT="${MY_PN}"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~ia64 ~ppc ~sparc x86"

DEPEND=">=gnome-base/libglade-2.0
	>=media-libs/gstreamer-0.8*
	gnome-base/gnome-vfs"

RDEPEND="${DEPEND}
	virtual/cdrtools"

src_compile() {

	cd ${S}

	AT_GNUCONF_UPDATE="yes"
	eautoreconf

	gnome2_src_compile
}
