# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
inherit cornucopia_git
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

RDEPEND=">=dev-libs/glib-2.12.0
	>=dev-libs/libgee-0.5.0
	>=dev-libs/dbus-glib-0.76
	>=sys-mobilephone/libfsoframework-0.2.2"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.8"

