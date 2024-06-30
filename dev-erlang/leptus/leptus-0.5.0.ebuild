# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang REST framework that runs on top of Cowboy"
HOMEPAGE="https://sinasamavati.xyz/leptus"
SRC_URI="https://github.com/sinasamavati/leptus/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lang/erlang
	>=dev-erlang/cowboy-2.4.0
	>=dev-erlang/jiffy-0.15.2
"
BDEPEND=""
