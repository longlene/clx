# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fcitx5 theme to match KDE's Breeze style"
HOMEPAGE="https://github.com/scratch-er/fcitx5-breeze"
SRC_URI="https://github.com/scratch-er/fcitx5-breeze/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	app-i18n/fcitx
"
BDEPEND=""

src_install() {
	local themes=/usr/share/fcitx5/themes
	insinto ${themes}/breeze
	newins theme_light.conf theme.conf
	doins prev.png next.png arrow.png radio.png panel.png highlight.png
	insinto ${themes}/breeze-dark
	newins theme_dark.conf theme.conf
	newins panel_dark.png panel.png
	insinto ${themes}/breeze-translucent
	newins theme_light_translucent.conf theme.conf
	newins panel_light_translucent.png panel.png
	insinto ${themes}/breeze-dark-translucent
	newins theme_dark_translucent.conf theme.conf
	newins panel_dark_translucent.png  panel.png
	for dir in breeze-dark breeze-translucent breeze-dark-translucent ; do
		for file in prev.png next.png arrow.png radio.png highlight.png ; do
			dosym ${themes}/breeze/${file} ${themes}/${dir}/${file}
		done
	done
}
