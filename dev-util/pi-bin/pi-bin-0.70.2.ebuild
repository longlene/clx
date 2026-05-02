# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Coding agent CLI with read, bash, edit, write tools and session management"
HOMEPAGE="
	https://github.com/badlogic/pi-mono/
	https://pi.dev/
"
SRC_URI="
	amd64? ( https://github.com/badlogic/pi-mono/releases/download/v${PV}/pi-linux-x64.tar.gz -> pi-linux-x64-${PV}.tar.gz )
	arm64? ( https://github.com/badlogic/pi-mono/releases/download/v${PV}/pi-linux-arm64.tar.gz -> pi-linux-arm64-${PV}.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/pi

src_install() {
	dobin pi
	einstalldocs
}
