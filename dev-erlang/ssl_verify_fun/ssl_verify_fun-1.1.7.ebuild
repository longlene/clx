# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="Collection of ssl verification functions for Erlang"
HOMEPAGE="https://github.com/deadtrickster/ssl_verify_fun.erl"
SRC_URI="https://github.com/deadtrickster/ssl_verify_fun.erl/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
