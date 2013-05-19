# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils
inherit git

DESCRIPTION="The FreeSmartPhone.org framework APIs."
HOMEPAGE="http://www.freesmartphone.org/"

EGIT_REPO_URI="git://git.freesmartphone.org/zhone.git"
EGIT_TREE="tags/milestone5"
EGIT_PROJECT="zhone"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE="gsm gps readline"

RDEPEND="
	>=dev-python/python-e_dbus-20090115-r38500
	>=dev-python/python-evas-20090115-r38500
	>=dev-python/python-edje-20090115-r38500
	>=dev-python/python-ecore-20090115-r38500
	>=sys-apps/dbus-1.2
	>=sys-mobilephone/freesmartphone-framework-0.4
	dev-python/pycairo"

DEPEND="media-libs/edje"


src_unpack() {
	# Fetch and unpack current git sources
	git_src_unpack

	cd "${S}"

	# Change the paths for setup.py and fix unicode problem
	epatch "${FILESDIR}/${PN}-setup.diff"
	epatch "${FILESDIR}/${PN}-unicode.diff"
}
