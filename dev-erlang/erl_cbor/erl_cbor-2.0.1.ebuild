# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An implementation of the CBOR data encoding format in Erlang"
HOMEPAGE="https://github.com/miniclip/erl_cbor"
SRC_URI="https://github.com/miniclip/erl_cbor/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
