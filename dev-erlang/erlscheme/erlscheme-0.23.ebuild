# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="An implementation of the Scheme programming language for the Erlang/OTP VM"
HOMEPAGE="https://github.com/mikpe/erlscheme"
SRC_URI="https://github.com/mikpe/erlscheme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
