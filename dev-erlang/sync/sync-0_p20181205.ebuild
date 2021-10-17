# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="d7ded2d221fb542b3417cffe77163206613daacb"

DESCRIPTION="On-the-fly recompiling and reloading in Erlang. Code without friction"
HOMEPAGE="https://github.com/rustyio/sync"
SRC_URI="https://github.com/rustyio/sync/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
