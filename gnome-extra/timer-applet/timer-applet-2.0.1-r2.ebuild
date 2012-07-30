# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils gnome2 python

DESCRIPTION="A countdown timer applet for the GNOME panel"
HOMEPAGE="http://timerapplet.sourceforge.net"
SRC_URI="mirror://sourceforge/timerapplet/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc sounds libnotify"

DEPEND="|| ( ( virtual/python:2.4 dev-python/elementtree )
		virtual/python:2.5 virtual/python:2.6 )
	>=dev-python/pygtk-2.10
	>=dev-python/gnome-python-2.16
	>=dev-python/gnome-python-desktop-2.16
	>=dev-python/notify-python-0.1
	>=dev-python/dbus-python-0.8"
RDEPEND="${DEPEND}"

DOCS="AUTHORS NEWS README"

src_prepare() {
	ln -sf $(type -P true) "${S}/py-compile" || die
	epatch "${FILESDIR}"/${P}-stop-pulsing.patch
}

pkg_postinst() {
	python_mod_optimize $(python_get_sitedir)/timerapplet
}

pkg_postrm() {
	python_mod_cleanup $(python_get_sitedir)/timerapplet
}

