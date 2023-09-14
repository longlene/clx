# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="python pandas, plotly, seaborn support & dataframes manipulation over erlang"
HOMEPAGE="https://github.com/zgbjgg/jun"
SRC_URI="https://github.com/zgbjgg/jun/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-erlang/lager-3.6.1
	>=dev-erlang/erlport-0.9.8
"
BDEPEND=""
