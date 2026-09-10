# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Zsh configuration framework with blazing speed and modular extensions"
HOMEPAGE="https://github.com/zimfw/zimfw"
SRC_URI="https://github.com/zimfw/zimfw/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-shells/zsh"

src_install() {
	insinto /usr/share/${PN}
	doins zimfw.zsh

	einstalldocs
}
