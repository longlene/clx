# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang InfluxDB UDP writer"
HOMEPAGE="https://github.com/palkan/influx_udp"
SRC_URI="https://github.com/palkan/influx_udp/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/ulitos
	dev-erlang/poolboy
"
BDEPEND=""
