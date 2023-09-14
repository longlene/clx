# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A library for high-performance, modern 2D graphics with SDL written in C"
HOMEPAGE="https://github.com/grimfang4/sdl-gpu"
SRC_URI="https://github.com/grimfang4/sdl-gpu/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

#TODO add use flags

DEPEND="|| ( media-libs/libsdl2 media-libs/libsdl )"
RDEPEND="${DEPEND}"
