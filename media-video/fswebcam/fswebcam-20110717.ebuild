# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A neat and simple webcam app"
HOMEPAGE="http://www.sanslogic.co.uk/fswebcam/"
SRC_URI="mirror://github/fsphil/fswebcam/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="v4l"

DEPEND="
media-libs/gd
v4l? ( media-libs/libv4l )"
RDEPEND="${DEPEND}"
