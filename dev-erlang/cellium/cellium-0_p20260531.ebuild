# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Text mode UI library for Erlang/OTP"
HOMEPAGE="https://github.com/wmealing/cellium"
SRC_URI="https://github.com/wmealing/cellium/archive/7683d7b9b6905333f05f346bd2ea8decb56af122.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/cellium-7683d7b9b6905333f05f346bd2ea8decb56af122"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_prepare() {
	# Remove doc/lint plugins; they would be fetched from hex (no network in sandbox)
	perl -0777 -i -pe 's/\{plugins,\s*\[.*?\]\s*\}\.\n?//s' rebar.config || die
	sed -i '/{project_plugins,/d' rebar.config || die
	rebar3_src_prepare
}

src_install() {
	local appdir="${S}/_build/default/lib/cellium"
	local destdir
	destdir="$(get_erl_libs)/cellium-${PV}"
	insinto "${destdir}/ebin"
	doins "${appdir}"/ebin/*.{app,beam}
	insinto "${destdir}/include"
	doins "${S}"/include/*.hrl
	insinto "${destdir}/priv"
	doins "${S}"/priv/*
	dodoc README.md
}
