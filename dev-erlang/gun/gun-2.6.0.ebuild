# Copyright 1999-2017 Gentoo Foundation
# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="HTTP/1.1, HTTP/2 and Websocket client for Erlang/OTP"
HOMEPAGE="https://github.com/ninenines/gun"
SRC_URI="https://github.com/ninenines/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-erlang/cowlib-2.20.0
	>=dev-lang/erlang-27"
DEPEND="${RDEPEND}"

src_prepare() {
	# Upstream ships a pre-generated ebin/gun.app and no src/*.app.src;
	# rebar_set_vsn and rebar3 both expect the app description
	# at src/${PN}.app.src. The vsn is already hardcoded in the app file.
	mv "${S}/ebin/gun.app" "${S}/src/gun.app.src" || die
	rm -rf "${S}/ebin" || die

	rebar3_src_prepare
}
