# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Coding agent CLI with read, bash, edit, write tools and session management"
HOMEPAGE="
	https://github.com/badlogic/pi-mono/
	https://pi.dev/
"
MY_URI="https://github.com/badlogic/pi-mono/releases/download/v${PV}"
SRC_URI="
	amd64? ( ${MY_URI}/pi-linux-x64.tar.gz -> pi-linux-x64-${PV}.tar.gz )
	arm64? ( ${MY_URI}/pi-linux-arm64.tar.gz -> pi-linux-arm64-${PV}.tar.gz )
"

S="${WORKDIR}"/pi

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"

QA_PREBUILT="
	opt/${PN}/pi
	opt/${PN}/node_modules/@mariozechner/clipboard-linux-x64-gnu/clipboard.linux-x64-gnu.node
"

RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	dodoc -r docs README.md CHANGELOG.md
	rm -rf docs README.md CHANGELOG.md

	insinto /opt/${PN}
	doins -r ./*
	fperms a+x /opt/${PN}/pi
	dodir /opt/bin
	dosym "../${PN}/pi" /opt/bin/pi
}
