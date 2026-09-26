# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN%-bin}"

DESCRIPTION="Lightweight Rust reimplementation of the frp reverse proxy (binary)"
HOMEPAGE="https://github.com/yangchaoliuyang/frp-mini"
SRC_URI="
	amd64? ( https://github.com/yangchaoliuyang/${MY_PN}/releases/download/${PV}/${MY_PN}-${PV}-linux-x86_64.zip )
	arm64? ( https://github.com/yangchaoliuyang/${MY_PN}/releases/download/${PV}/${MY_PN}-${PV}-linux-aarch64.zip )
"
S="${WORKDIR}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror strip"

# both provide /usr/bin/frpc and /usr/bin/frps
RDEPEND="!net-vpn/frp"
BDEPEND="app-arch/unzip"

QA_PREBUILT="usr/bin/frpc usr/bin/frps"

src_install() {
	dobin frpc frps
}

pkg_postinst() {
	elog "See ${HOMEPAGE} for frps.toml/frpc.toml examples."
	elog "frps serves its web dashboard on port 7500 by default."
}
