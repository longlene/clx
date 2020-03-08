# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rebar vcs-snapshot

EGIT_COMMIT="924a6c528586afa8347985e944d261930b30eb44"

DESCRIPTION="RocksDB for Erlang"
HOMEPAGE="https://gitlab.com/barrel-db/erlang-rocksdb/"
SRC_URI="https://gitlab.com/barrel-db/erlang-rocksdb/-/archive/${PV}/erlang-rocksdb-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""