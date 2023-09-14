# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Erlang RADIUS server framework"
HOMEPAGE="https://github.com/travelping/eradius"
SRC_URI="https://github.com/travelping/eradius/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/lager-3.5.1
	>=dev-erlang/exometer_core-1.5.2
"
RDEPEND="${DEPEND}"
BDEPEND=""
