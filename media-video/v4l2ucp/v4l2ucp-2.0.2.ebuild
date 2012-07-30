# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2
inherit cmake-utils

DESCRIPTION="A universal control panel for all Video for Linux Two (V4L2)
devices"
HOMEPAGE="http://v4l2ucp.sf.net/"
SRC_URI="mirror://sourceforge/v4l2ucp/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="x11-libs/qt-gui:4
		media-libs/libv4l"
