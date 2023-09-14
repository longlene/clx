# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

MY_PN="liblastfm"

EGIT_REPO_URI="git://${MY_PN}.git.sourceforge.net/gitroot/${MY_PN}/${MY_PN}"

inherit base autotools git-r3

DESCRIPTION="C-API for the Last.fm web service written with libcurl"
HOMEPAGE="http://liblastfm.sourceforge.net"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="arm ~amd64 ~x86"
IUSE=""

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

src_prepare() {
        eautoreconf
}
