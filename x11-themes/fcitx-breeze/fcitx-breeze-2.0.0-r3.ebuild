# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fcitx5 theme to match KDE's Breeze style"
HOMEPAGE="https://github.com/scratch-er/fcitx5-breeze"
SRC_URI="https://github.com/scratch-er/fcitx5-breeze/releases/download/v${PV}/fcitx5-breeze-prebuilt-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="5"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	app-i18n/fcitx:5
"
BDEPEND=""

S="${WORKDIR}"/fcitx5-breeze

src_install() {
	./install.sh "${D}"/usr || die "install failed"
}
