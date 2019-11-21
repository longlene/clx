# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="an erlang wrapper for eredis to support cluster mode of redis 3.0.0+"
HOMEPAGE="https://github.com/adrienmo/eredis_cluster"
SRC_URI="https://github.com/adrienmo/eredis_cluster/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/poolboy
"
RDEPEND="${DEPEND}"
BDEPEND=""
