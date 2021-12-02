# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Chinese text-to-speech software"
HOMEPAGE="https://www.eguidedog.net/ekho.php"
SRC_URI="https://sourceforge.net/projects/e-guidedog/files/Ekho/${PV}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-accessibility/espeak-ng
	media-libs/libsndfile
	media-sound/pulseaudio
"
RDEPEND="${DEPEND}"
BDEPEND=""
