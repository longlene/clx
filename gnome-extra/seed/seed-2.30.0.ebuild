# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit gnome2

DESCRIPTION="JavaScript library and interpreter bridging WebKit with the GNOME platform."
HOMEPAGE="http://live.gnome.org/Seed"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	net-libs/webkit-gtk
	>=dev-libs/gobject-introspection-0.6.3
	>=gnome-extra/gnome-js-common-0.1
	>=dev-util/intltool-0.35.0
	>=dev-lang/perl-5.8.1
	>=dev-util/pkgconfig-0.9.0
	"
RDEPEND="${DEPEND}"

