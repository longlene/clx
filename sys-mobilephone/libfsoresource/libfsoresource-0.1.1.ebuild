# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cornucopia_git
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

IUSE="debug"

RDEPEND=">=dev-libs/dbus-glib-0.76
	>=sys-mobilephone/libfsobasics-0.8.9.9
	>=sys-mobilephone/libfso-glib-2010.05.11.2
	>=sys-mobilephone/libfsoframework-0.2.3.1"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.8"

src_configure()
{
	econf \
		$(use_enable debug)
}
