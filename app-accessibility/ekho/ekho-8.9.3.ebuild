# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Chinese text-to-speech software"
HOMEPAGE="https://www.eguidedog.net/ekho.php"
SRC_URI="https://github.com/hgneng/ekho/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

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

src_prepare() {
	default
	eautoreconf
}
