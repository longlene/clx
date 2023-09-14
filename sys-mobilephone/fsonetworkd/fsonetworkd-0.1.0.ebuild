# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit cornucopia_git
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

RDEPEND=">=dev-libs/glib-2.18.0
	>=dev-libs/dbus-glib-0.76
	>=sys-apps/dbus-1.2.1
	>=sys-mobilephone/libfso-glib-2010.05.11.2
	>=sys-mobilephone/libfsoframework-0.2.3"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.8.1"
