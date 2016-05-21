# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="Simple and portable GUI library in C"
HOMEPAGE="https://github.com/andlabs/libui"
SRC_URI=""

EGIT_REPO_URI="https://github.com/andlabs/libui.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="x11-libs/gtk+:3"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/include
	doins ui.h ui_unix.h
	dolib.so out/libui.so*
	dodoc README.md
}
