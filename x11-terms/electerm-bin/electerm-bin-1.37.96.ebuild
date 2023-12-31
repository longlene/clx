# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="An electron-based SSH/SFTP Connection manager and terminal"
HOMEPAGE="https://electerm.html5beta.com/"
SRC_URI="https://github.com/electerm/electerm/releases/download/v${PV}/electerm-${PV}-linux-x64.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_PRESTRIPPED="
	/usr/lib/electerm-bin/*
	/usr/lib/electerm-bin/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/linux-x64/node.napi.glibc.node
"

S="${WORKDIR}"/electerm-${PV}-linux-x64

src_prepare() {
	default
	rm -rf resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/{android-arm,darwin-x64+arm64,linux-arm64,win32-ia32,android-arm64,linux-arm,win32-x64,linux-x64/node.napi.musl.node}
}

src_install() {
	insinto /usr/lib/electerm-bin
	doins -r "${S}"/*
	dosym /usr/lib/electerm-bin/electerm /usr/bin/electerm-bin
	make_desktop_entry electerm-bin "Electerm"
	einstalldocs
}
