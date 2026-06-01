# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A stupid simple expression matcher and evaluater in pure Erlang"
HOMEPAGE="https://github.com/ratopi/matcher/"
SRC_URI="https://github.com/ratopi/matcher/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"
