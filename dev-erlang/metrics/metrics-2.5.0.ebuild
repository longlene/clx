# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A generic interface to different metrics systems in Erlang"
HOMEPAGE="https://github.com/benoitc/erlang-metrics"
SRC_URI="https://github.com/benoitc/erlang-${PN}/archive/${PV}.tar.gz -> erlang-${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
S="${WORKDIR}"/erlang-${P}
KEYWORDS="~amd64 ~arm ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
