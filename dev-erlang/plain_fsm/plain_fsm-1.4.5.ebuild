# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A behaviour/support library for writing plain Erlang FSMs"
HOMEPAGE="https://github.com/uwiger/plain_fsm"
SRC_URI="https://github.com/uwiger/plain_fsm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	rm src/fsm_example.erl
	rebar_src_prepare
}
