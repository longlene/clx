# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="264312a0fc9e1f945000b6c2920df28e2a8a641d"

DESCRIPTION="Dafka is a decentralized distributed streaming platform"
HOMEPAGE="https://github.com/zeromq/dafka"
SRC_URI="https://github.com/zeromq/dafka/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	net-libs/czmq
	dev-libs/leveldb
"
RDEPEND="${DEPEND}"
BDEPEND=""
