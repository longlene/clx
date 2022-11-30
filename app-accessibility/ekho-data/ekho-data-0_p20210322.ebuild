# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="ekho voice data"
HOMEPAGE="https://www.eguidedog.net/ekho.php"
SRC_URI="https://sourceforge.net/projects/e-guidedog/files/Ekho-Voice-Data/0.2/pinyin-yali-44100-wav-v10.tar.xz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	insinto /usr/share/ekho-data/pinyin
	doins pinyin-yali-44100-wav-v10/*.wav
}
