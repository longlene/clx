# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-2

DESCRIPTION="A tool for manipulating X windows"
HOMEPAGE="https://github.com/sdhand/x11fs"
SRC_URI=""

EGIT_REPO_URI="https://github.com/sdhand/x11fs.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	sys-fs/fuse
	x11-libs/libxcb
	x11-libs/xcb-util-wm
"
RDEPEND="${DEPEND}"

src_install() {
	dobin bin/x11fs
	dodoc README
}
