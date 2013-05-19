# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit shr

DESCRIPTION="The SHR framework phonegui library."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

PROJECT_NAME="${PN}"
EGIT_TREE="d39cea7ab6be525b4125b06a44b6ce5df2af3dc1"

RDEPEND="=sys-mobilephone/libphone-utils-20090724
		 sys-mobilephone/libframeworkd-glib
		 dev-libs/dbus-glib"
DEPEND="dev-libs/dbus-glib"
