# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit cmake git-r3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

EGIT_REPO_URI="http://git.openwrt.org/project/mdnsd.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-libs/libubox
	sys-apps/ubus
"
RDEPEND="${DEPEND}"
