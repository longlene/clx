# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=2
inherit cmake-utils git

EGIT_REPO_URI="git://v4l2ucp.git.sourceforge.net/gitroot/v4l2ucp/v4l2ucp"

DESCRIPTION="A universal control panel for all Video for Linux Two (V4L2)
devices"
HOMEPAGE="http://v4l2ucp.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4"

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
}
