# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

MY_P="${PN}-beam-${PV}"

DESCRIPTION="An Erlang INI parser"
HOMEPAGE="
	https://github.com/erlcloud/eini
	https://github.com/aws-beam/eini-beam
"
SRC_URI="https://github.com/aws-beam/eini-beam/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/${MY_P}
