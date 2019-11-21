# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar vcs-snapshot

EGIT_COMMIT="924a6c528586afa8347985e944d261930b30eb44"

DESCRIPTION="RocksDB Erlang driver"
HOMEPAGE="https://github.com/voxoz/rocks"
SRC_URI="https://github.com/voxoz/rocks/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
