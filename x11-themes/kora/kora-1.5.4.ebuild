# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Kora icon theme for GNU/Linux"
HOMEPAGE="https://github.com/bikass/kora"
SRC_URI="https://github.com/bikass/kora/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/share/icons
	doins -r kora{,-light-panel,-light,-pgrey}
	einstalldocs
}
