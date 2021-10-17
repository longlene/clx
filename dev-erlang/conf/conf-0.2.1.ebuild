# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="YAML configuration for Erlang applications"
HOMEPAGE="https://github.com/processone/conf"
SRC_URI="https://github.com/processone/conf/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/fast_yaml-1.0.30
	>=dev-erlang/yval-1.0.7
"
BDEPEND=""
