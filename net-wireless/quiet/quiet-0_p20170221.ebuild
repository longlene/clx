# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

EGIT_COMMIT="0cfd42964b1a65d1f0b4637bb125d60b0af3b64f"

DESCRIPTION="Transmit with sound"
HOMEPAGE="https://github.com/quiet/quiet"
SRC_URI="https://github.com/quiet/quiet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	net-libs/liquid-dsp
	dev-libs/libfec
	dev-libs/jansson
	media-libs/libsndfile
	media-libs/portaudio
"
RDEPEND="${DEPEND}"

