# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

MY_PN="aws-erlang"
MY_P=${MY_PN}-${PV}

DESCRIPTION="AWS clients for Erlang"
HOMEPAGE="https://github.com/aws-beam/aws-erlang"
SRC_URI="https://github.com/aws-beam/aws-erlang/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-erlang/hackney-1.18.0
"
RDEPEND="${DEPEND}
	>=dev-erlang/jsx-3.0.0
	>=dev-erlang/aws_beam_core-1.0.1
"
BDEPEND=""

S="${WORKDIR}"/${MY_P}
