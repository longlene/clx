# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base git-2 autotools

DESCRIPTION=""
HOMEPAGE="http://www.freesmartphone.org"
EGIT_REPO_URI="git://git.freesmartphone.org/aurora.git"
EGIT_PROJECT="aurora"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.18.0
	>=dev-libs/dbus-glib-0.74
	>=sys-apps/dbus-1.2.1
	>=dev-libs/libgee-0.5.0
	>=sys-mobilephone/libfsobasics-0.9
	sys-mobilephone/libfso-glib
	sys-mobilephone/libfsoframework
	dev-libs/eina
	media-libs/edje
	x11-libs/evas
	x11-libs/ecore
	x11-libs/elementary
	dev-libs/libeflvala"
DEPEND="${RDEPEND}
	>=dev-lang/vala-0.7.10.5"

src_prepare() {
	S="${WORKDIR}/${P}/${PN}"
	cd ${S}
	eautoreconf
}

src_configure()
{
	econf \
		$(use_enable debug)
}
