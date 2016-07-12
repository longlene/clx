# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

MY_PN=Box2D

inherit cmake-utils eutils

DESCRIPTION="Box2D is an open source physics engine written primarily for games."
HOMEPAGE="http://www.box2d.org"
SRC_URI="https://github.com/erincatto/Box2D/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

RDEPEND="media-libs/freeglut
	app-arch/unzip"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/${MY_PN}-${PV}/${MY_PN}

src_configure()
{
	mycmakeargs="${mycmakeargs} -DBOX2D_BUILD_SHARED=ON"

	cmake-utils_src_configure
}

