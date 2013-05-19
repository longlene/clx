# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit base git autotools

DESCRIPTION=""
HOMEPAGE=""

EGIT_REPO_URI="http://shr.bearstech.com/repo/${PN}.git"
EGIT_PROJECT="${PN}"

LICENSE="GPL-3"
SLOT="0"
EAPI="2"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""
DOCS="README"

RDEPEND="
	dev-libs/dbus-glib
	sys-apps/dbus
	sys-mobilephone/libframeworkd-glib
	sys-mobilephone/libphone-utils"
DEPEND="${RDEPEND}"

src_prepare() {
	git_src_prepare
	eautoreconf
}
