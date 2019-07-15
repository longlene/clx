# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="b4a30dc55d30500a1c239d6234444e1ecff5aab5"

DESCRIPTION="CR: Chain Replication Database for KVS"
HOMEPAGE="https://github.com/synrc/cr"
SRC_URI="https://github.com/synrc/cr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-erlang/kvs
"
RDEPEND="${DEPEND}"
BDEPEND=""
