# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="SSL Certificates for Erlang"
HOMEPAGE="https://github.com/certifi/erlang-certifi"
SRC_URI="https://github.com/certifi/erlang-certifi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-erlang/parse_trans
"
RDEPEND="${DEPEND}"
BDEPEND=""
