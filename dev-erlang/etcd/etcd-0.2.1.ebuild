# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="erlang driver for etcd"
HOMEPAGE="https://github.com/yunba/erl-etcd"
SRC_URI="https://github.com/yunba/erl-${PN}/archive/${PV}.tar.gz -> erl-${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/jiffy-0.14.11
	>=dev-erlang/ibrowse-4.4.0
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

S="${WORKDIR}"/erl-${P}

#src_prepare() {
#	rebar_src_prepare
#	rebar_fix_include_path cowlib
#}
