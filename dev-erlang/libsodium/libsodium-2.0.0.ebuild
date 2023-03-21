# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="libsodium asynchronous port driver for Erlang and Elixir"
HOMEPAGE="https://github.com/potatosalad/erlang-libsodium"
SRC_URI="https://github.com/potatosalad/erlang-libsodium/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libsodium"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erlang-${P}
