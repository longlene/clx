# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit cmake-utils

DESCRIPTION="Visualizes massif data."
HOMEPAGE="http://kde-apps.org/content/show.php/Massif+Visualizer?content=122409"
SRC_URI="http://kde-apps.org/CONTENT/content-files/122409-${P}.tar.bz2 ->
${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=media-gfx/kgraphviewer-2.1"
RDEPEND="${DEPEND}"
