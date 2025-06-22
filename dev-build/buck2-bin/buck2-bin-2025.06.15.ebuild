# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit unpacker

MY_PV=${PV//./-}

DESCRIPTION="fast multi-language build system"
HOMEPAGE="
	https://buck2.build/
	https://github.com/facebook/buck2
"
SRC_URI="
	https://github.com/facebook/buck2/releases/download/${MY_PV}/buck2-x86_64-unknown-linux-gnu.zst -> ${P}.zst
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-arch/zstd
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	newbin ${P} buck2-bin
}
