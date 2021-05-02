# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3

DESCRIPTION="sb - simple webkit browser"
HOMEPAGE="https://github.com/mutantturkey/sb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mutantturkey/sb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="
	net-libs/webkit-gtk
	x11-libs/gtk+:2
"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install
}
