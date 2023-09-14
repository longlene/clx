# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="AWS Lambda in Erlang"
HOMEPAGE="https://github.com/alertlogic/erllambda"
SRC_URI="https://github.com/alertlogic/erllambda/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/jsone
	dev-erlang/lhttpc
	dev-erlang/erlcloud
"
BDEPEND=""
