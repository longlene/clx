# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/enats_msg.app.src"

inherit rebar3

DESCRIPTION="NATS Protocol Message Encoder/Decoder"
HOMEPAGE="https://github.com/travelping/enats_msg"
SRC_URI="https://github.com/travelping/enats_msg/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/enats_msg-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	sed -e "s/{vsn, semver}/{vsn, \"${PV}\"}/" -i src/enats_msg.app.src || die
	rebar3_src_prepare
}

src_install() {
	rebar3_install_lib "_build/default/lib/enats_msg"
	einstalldocs
}
