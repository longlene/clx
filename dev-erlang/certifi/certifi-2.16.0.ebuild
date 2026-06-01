# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="SSL Certificates for Erlang"
HOMEPAGE="https://github.com/certifi/erlang-certifi"
SRC_URI="https://github.com/certifi/erlang-certifi/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/erlang-certifi-${PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
