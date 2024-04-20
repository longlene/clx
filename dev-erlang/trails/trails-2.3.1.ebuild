# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar vcs-snapshot

DESCRIPTION="A couple of improvements over Cowboy Routes"
HOMEPAGE="https://github.com/inaka/cowboy-trails"
SRC_URI="https://github.com/inaka/cowboy-trails/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/cowboy
	dev-erlang/ranch
"
BDEPEND=""
