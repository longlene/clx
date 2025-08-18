# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="An Erlang NIF library for Colin Percival's scrypt function"
HOMEPAGE="https://github.com/kpy3/erlscrypt"
SRC_URI="https://github.com/kpy3/erlscrypt/archive/refs/tags/${PV}.tar.gz -> erl${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erl${P}
