# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="a modern C++ GUI library"
HOMEPAGE="http://nanapro.org"
SRC_URI="https://github.com/cnjinhao/nana/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost"
SLOT="0"
#KEYWORDS="~amd64 ~arm ~x86"
IUSE="alsa jpeg png xft"

DEPEND="
	alsa? ( media-libs/alsa-lib )
	jpeg? ( virtual/jpeg )
	png? ( media-libs/libpng )
	xft? ( x11-libs/libXft )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DNANA_CMAKE_ENABLE_PNG=$(usex png)
	-DNANA_CMAKE_ENABLE_JPEG=$(usex jpeg)
	-DNANA_CMAKE_ENABLE_AUDIO=$(usex alsa)
	-DNANA_CMAKE_STD_FILESYSTEM_FORCE=ON
	)
	cmake-utils_src_configure
}
