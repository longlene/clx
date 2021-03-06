# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar

DESCRIPTION="Simple exponential backoffs in Erlang"
HOMEPAGE="https://github.com/ferd/backoff"
SRC_URI="https://github.com/ferd/backoff/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
