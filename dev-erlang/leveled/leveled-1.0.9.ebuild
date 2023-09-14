# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="An Erlang Key-Value Store"
HOMEPAGE="https://github.com/martinsumner/leveled"
SRC_URI="https://github.com/martinsumner/leveled/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-erlang/lz4
"
BDEPEND=""
