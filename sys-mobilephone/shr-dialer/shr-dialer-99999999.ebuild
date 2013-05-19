# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The SHR dialer application."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
DOCS="README"

PROJECT_NAME="${PN}"

RDEPEND="sys-mobilephone/libframeworkd-phonegui
		 >=sys-mobilephone/libframeworkd-glib-20090125
		 dev-libs/dbus-glib"
DEPEND="dev-libs/dbus-glib"

inherit shr
