# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="c2dc88d0698ce157562378e8386060709e861a96"

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
