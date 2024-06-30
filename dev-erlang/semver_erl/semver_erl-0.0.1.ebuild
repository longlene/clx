# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Semantic Versioning Support Library"
HOMEPAGE="https://hex.pm/packages/semver_erl"
SRC_URI="https://repo.hex.pm/tarballs/${P}.tar"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
