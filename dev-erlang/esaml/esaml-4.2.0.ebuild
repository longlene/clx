# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang SAML library, SSO and SLO, with Cowboy integration"
HOMEPAGE="https://github.com/handnot2/esaml"
SRC_URI="https://github.com/handnot2/esaml/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/cowboy
"
RDEPEND="${DEPEND}"
BDEPEND=""
