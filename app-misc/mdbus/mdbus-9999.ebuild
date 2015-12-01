# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2

DESCRIPTION="Mickey's own dbus introspection utility"
HOMEPAGE="http://wiki.openmoko.org/wiki/OpenmokoFramework/mdbus"
EGIT_REPO_URI="git://git.freesmartphone.org/python-helpers.git"

LICENSE="GPL2+"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

DEPEND=""
RDEPEND="dev-python/dbus-python"

src_install() {
	cd "${S}/mickeydbus"
	dobin mdbus || die
}

