# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="f11da17a12a7af8dbccc754cd7daab0bb33c59f8"

inherit rebar3

REBAR_APP_SRC="src/enif_protobuf.app.src"

DESCRIPTION="Google Protobuf encoder/decoder for Erlang, implemented as a NIF"
HOMEPAGE="https://github.com/jinganix/enif_protobuf"
SRC_URI="https://github.com/jinganix/enif_protobuf/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/enif_protobuf-${MY_COMMIT}"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror"

src_prepare() {
	# app.src uses {vsn, "git"} but rebar_set_vsn expects {vsn, git}
	sed -i 's/{vsn, "git"}/{vsn, git}/' src/enif_protobuf.app.src || die
	rebar3_src_prepare
	# Fix project name — $(notdir $(BASEDIR)) gives the commit hash dir, not enif_protobuf
	sed -i 's|^PROJECT ?=.*|PROJECT := enif_protobuf|' c_src/Makefile || die
}

src_install() {
	# OTP requires dir name to match the Erlang app name (enif_protobuf, not enif-protobuf)
	local dest="$(get_erl_libs)/enif_protobuf-${PV}"
	insinto "${dest}/ebin"
	doins "${S}"/_build/default/lib/enif_protobuf/ebin/*
	insinto "${dest}/priv"
	doins "${S}"/priv/enif_protobuf.so
	dodoc README.md
}
