# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8
inherit cornucopia_git
EGIT_COMMIT="1f9281ac4320eed66411fde8fe21ea87ee138e78"

IUSE="debug"

RDEPEND=">=dev-libs/glib-2.18.0
	=dev-libs/libnl-2*"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.9.7"

src_configure()
{
	econf \
		$(use_enable debug)
}
