# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Doing Phonetics By Computer"
HOMEPAGE="http://www.fon.hum.uva.nl/praat/"
SRC_URI="https://github.com/praat/praat/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
	x11-libs/libXmu
	x11-libs/libXt
	x11-libs/libX11
	x11-libs/libICE
	x11-libs/libXext
	x11-libs/libSM
	x11-libs/libXp
	x11-libs/gtk+
"
RDEPEND="${DEPEND}"

