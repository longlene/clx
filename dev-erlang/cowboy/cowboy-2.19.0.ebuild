# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Small, fast, modern HTTP server for Erlang/OTP"
HOMEPAGE="https://github.com/ninenines/cowboy"
SRC_URI="https://github.com/ninenines/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

# No src/cowboy.app.src; the app file ships prebuilt in ebin/.
REBAR_APP_SRC="ebin/cowboy.app"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-erlang/cowlib
	>=dev-erlang/ranch-1.6.1
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

DOCS=( CHANGELOG.md )

src_prepare() {
	rebar3_src_prepare

	# The QUIC shim includes headers from dev-erlang/quicer, which is
	# not packaged yet; drop the module (cowboy.start_quic/3 then fails
	# at runtime instead of compile time).
	rm src/cowboy_quicer.erl || die
	sed -i "s/'cowboy_quicer',// " ebin/cowboy.app || die
}

src_compile() {
	erebar3 compile
}
