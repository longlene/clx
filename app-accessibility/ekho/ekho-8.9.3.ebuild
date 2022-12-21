# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic

DESCRIPTION="Chinese text-to-speech software"
HOMEPAGE="https://www.eguidedog.net/ekho.php"
SRC_URI="
	https://github.com/hgneng/ekho/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://sourceforge.net/projects/e-guidedog/files/Ekho-Voice-Data/0.2/pinyin-yali-44100-wav-v10.tar.xz
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-accessibility/espeak-ng
	media-libs/libsndfile
	media-libs/libpulse
	dev-libs/utfcpp
	media-sound/sonic
"
RDEPEND="${DEPEND}"
BDEPEND=""


src_prepare() {
	default
	mv "${WORKDIR}"/pinyin-yali-44100-wav-v10/*.wav ekho-data/pinyin
	rm ekho-data/pinyin.{index,voice}
	append-cflags "-I/usr/include/utf8cpp"
	append-cxxflags "-I/usr/include/utf8cpp"
	eautoreconf
}

src_compile() {
	default
	EKHO_DATA_PATH=${S}/ekho-data ./ekho >/dev/null 2>&1
}
