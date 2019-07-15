# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Job scheduler for load regulation"
HOMEPAGE="https://github.com/uwiger/jobs"
SRC_URI="https://github.com/uwiger/jobs/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/parse_trans-3.3.0
"
RDEPEND="${DEPEND}"
BDEPEND=""
