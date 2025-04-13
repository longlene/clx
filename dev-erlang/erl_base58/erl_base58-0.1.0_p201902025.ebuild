# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

EGIT_COMMIT="d79aa42ecabdb091492f0529b24559802fca20ee"

DESCRIPTION="A simple Erlang Base58 encoder and decoder"
HOMEPAGE="https://github.com/helium/erl-base58"
SRC_URI="https://github.com/helium/erl-base58/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erl-base58-${EGIT_COMMIT}
