# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Incredibly fast JavaScript runtime, bundler, test runner, and package manager"
HOMEPAGE="https://bun.com https://github.com/oven-sh/bun"
SRC_URI="
	amd64? ( https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-x64.zip -> ${P}-amd64.zip )
	arm64? ( https://github.com/oven-sh/bun/releases/download/bun-v${PV}/bun-linux-aarch64.zip -> ${P}-arm64.zip )
"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror strip test"

RDEPEND="sys-libs/glibc"
BDEPEND="app-arch/unzip"

QA_PREBUILT="usr/bin/bun"

src_install() {
	local dir
	if use amd64; then
		dir=bun-linux-x64
	else
		dir=bun-linux-aarch64
	fi

	dobin "${dir}"/bun
	dosym bun /usr/bin/bunx
}
