# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN%-bin}"

DESCRIPTION="Lightweight, secure sandboxes for untrusted processes, prebuilt binary"
HOMEPAGE="https://github.com/capsulerun/vpod"
SRC_URI="https://github.com/capsulerun/vpod/releases/download/v${PV}/${MY_PN}-x86_64-unknown-linux-gnu.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

QA_PREBUILT="usr/bin/${MY_PN}"

src_install() {
	dobin "${MY_PN}"
}
