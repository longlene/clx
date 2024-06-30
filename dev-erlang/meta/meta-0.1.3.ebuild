# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="A metaprogramming library for Erlang"
HOMEPAGE="https://github.com/efcasado/meta"
SRC_URI="https://github.com/efcasado/meta/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/forms
"
BDEPEND=""
