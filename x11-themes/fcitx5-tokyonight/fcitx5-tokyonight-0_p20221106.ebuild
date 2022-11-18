# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

EGIT_COMMIT="b02bd3bbec5639b389c4496ba8e29ba9afc62f9e"

DESCRIPTION="Fcitx5 Tokyonight theme"
HOMEPAGE="https://github.com/ch4xer/fcitx5-Tokyonight"
SRC_URI="https://github.com/ch4xer/fcitx5-Tokyonight/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	app-i18n/fcitx
"
BDEPEND=""

src_install() {
	local themes=/usr/share/fcitx5/themes
	insinto ${themes}
	doins -r Tokyonight-{Day,Storm}
	einstalldocs
}
