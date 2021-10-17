# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit cmake

DESCRIPTION="The Shark Machine Leaning Library"
HOMEPAGE="http://image.diku.dk/shark/"
SRC_URI="https://github.com/Shark-ML/Shark/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	sci-libs/atlas
"
RDEPEND="${DEPEND}"
