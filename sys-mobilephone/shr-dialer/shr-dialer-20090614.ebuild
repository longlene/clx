# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="The SHR dialer application."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

PROJECT_NAME="${PN}"
EGIT_TREE="a0a962e92eacd7c445952180de9d49013bd5513e"

RDEPEND="sys-mobilephone/libframeworkd-phonegui
		 >=sys-mobilephone/libframeworkd-glib-20090125
		 dev-libs/dbus-glib"
DEPEND="dev-libs/dbus-glib"

inherit shr
