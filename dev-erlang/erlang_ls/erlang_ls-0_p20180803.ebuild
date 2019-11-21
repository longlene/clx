# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="1d902af2abc46ec2233883d759e8187e12fe8bab"

DESCRIPTION="The Erlang Language Server Protocol Implementation"
HOMEPAGE="https://github.com/erlang-ls/erlang_ls"
SRC_URI="https://github.com/erlang-ls/erlang_ls/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-erlang/ranch-1.5.0
	>=dev-erlang/jsx-2.9.0
	>=dev-erlang/cowlib-2.3.0
	>=dev-erlang/redbug-1.2.0
	>=dev-erlang/lager-3.6.3
"
RDEPEND="${DEPEND}"
BDEPEND=""
