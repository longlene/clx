# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Open sub-millisecond Firebase alternative built on Rust, SQLite and Wasmtime"
HOMEPAGE="https://trailbase.io"
SRC_URI="https://github.com/trailbaseio/trailbase/releases/download/v${PV}/trailbase_v${PV}_x86_64_linux.zip -> ${P}-x86_64-linux.zip"
S="${WORKDIR}"

LICENSE="OSL-3.0"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror strip"

QA_PRESTRIPPED="usr/bin/trail"

BDEPEND="app-arch/unzip"

src_install() {
	dobin trail
	dodoc CHANGELOG.md
}
