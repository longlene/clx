# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="FlameGraph compatible, Poor Man's Profiler inspired Erlang profiler"
HOMEPAGE="https://github.com/kzemek/erlang_pmp"
SRC_URI="https://github.com/kzemek/erlang_pmp/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
