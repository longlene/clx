# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit shr

DESCRIPTION="The SHR ophonekit daemon."
HOMEPAGE="http://trac.shr-project.org/trac"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

PROJECT_NAME="${PN}"
EGIT_TREE="d39cea7ab6be525b4125b06a44b6ce5df2af3dc1"

RDEPEND="dev-libs/dbus-glib
		 sys-mobilephone/freesmartphone-framework
		 sys-mobilephone/libframeworkd-glib
		 sys-mobilephone/libframeworkd-phonegui
		 sys-mobilephone/libframeworkd-phonegui-efl
		 dev-db/sqlite"
DEPEND="dev-libs/dbus-glib"

src_install() {
	shr_src_install

	# Install the data files
	exeinto /etc/X11/Xsession.d
	insinto /usr/share/ophonekitd
	insinto etc/dbus-1/system.d
	doexe data/80ophonekitd || die
	#doins data/phonelog-database.sql || die
	doins data/ophonekitd.conf || die
}

