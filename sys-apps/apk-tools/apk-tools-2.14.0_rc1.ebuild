# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Alpine Package Keeper"
HOMEPAGE="https://github.com/alpinelinux/apk-tools"
SRC_URI="https://github.com/alpinelinux/apk-tools/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="lua"

RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -i 's/-Werror//' Make.rules
}

src_configure() {
	export LUA=no
}

src_install() {
	dosbin src/apk
	dolib.so src/libapk.so*
	dodoc README.md
}
