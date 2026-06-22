# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Erlang native interface to git"
HOMEPAGE="https://github.com/saleyn/egit"
SRC_URI="https://github.com/saleyn/egit/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libgit2
	dev-libs/libfmt
"
RDEPEND="${DEPEND}"
