# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="Prometheus.io client in Erlang"
HOMEPAGE="https://github.com/deadtrickster/prometheus.erl"
SRC_URI="https://github.com/deadtrickster/prometheus.erl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
