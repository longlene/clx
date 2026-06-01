# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="BERT Encoder/Decoder"
HOMEPAGE="https://github.com/yuce/bert.erl"
SRC_URI="https://github.com/yuce/bert.erl/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
S="${WORKDIR}"/bert.erl-${PV}
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

REBAR_APP_SRC=src/bert.app.src
