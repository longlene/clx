# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="app_config"
HOMEPAGE="https://github.com/Leapsight/app_config"
SRC_URI="https://github.com/Leapsight/app_config/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/key_value
"
BDEPEND=""

