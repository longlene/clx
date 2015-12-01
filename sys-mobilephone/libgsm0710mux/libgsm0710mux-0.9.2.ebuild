# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit cornucopia_git
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

IUSE="debug"

RDEPEND=">=dev-libs/glib-2.12.0
	>=sys-mobilephone/libfsobasics-0.8.3
	>=sys-mobilephone/libfsotransport-0.9.5
	>=sys-mobilephone/libgsm0710-1.2.0"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.6"

src_configure()
{
	econf \
		$(use_enable debug)
}
