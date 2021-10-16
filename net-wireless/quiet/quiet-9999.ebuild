# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake

DESCRIPTION="Transmit with sound"
HOMEPAGE="https://github.com/quiet/quiet"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/quiet/quiet.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/liquid-dsp
	dev-libs/libfec
	dev-libs/jansson
	media-libs/libsndfile
	media-libs/portaudio
"
RDEPEND="${DEPEND}"
