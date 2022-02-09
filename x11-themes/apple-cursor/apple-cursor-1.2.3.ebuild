# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="Opensource macOS Cursors"
HOMEPAGE="https://github.com/ful1e5/apple_cursor"
SRC_URI="https://github.com/ful1e5/apple_cursor/releases/download/v${PV}/macOSMonterey.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/icons/macOSMonterey
	doins -r cursors cursor.theme index.theme
	einstalldocs
}
