# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="MiMo Code AI coding assistant, prebuilt binary"
HOMEPAGE="https://github.com/XiaomiMiMo/MiMo-Code"
SRC_URI="https://github.com/XiaomiMiMo/MiMo-Code/releases/download/v${PV}/mimocode-linux-x64.tar.gz
	-> ${P}-linux-x64.tar.gz"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

QA_PREBUILT="usr/bin/mimo"

src_install() {
	dobin mimo
}
