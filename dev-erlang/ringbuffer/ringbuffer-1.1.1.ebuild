# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Ring buffer implementation for Erlang using ETS tables"
HOMEPAGE="https://github.com/zotonic/ringbuffer"
SRC_URI="https://github.com/zotonic/ringbuffer/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
