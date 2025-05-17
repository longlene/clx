# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot

DESCRIPTION="Opensource macOS Cursors"
HOMEPAGE="https://github.com/ful1e5/apple_cursor"
SRC_URI="https://github.com/ful1e5/apple_cursor/releases/download/v${PV}/macOS.tar.xz -> ${P}.tar.xz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/icons
	doins -r macOS{,-White}
	einstalldocs
}
