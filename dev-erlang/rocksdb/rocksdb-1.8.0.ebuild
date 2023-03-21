# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rebar

DESCRIPTION="RocksDB for Erlang"
HOMEPAGE="https://gitlab.com/barrel-db/erlang-rocksdb/"
SRC_URI="https://gitlab.com/barrel-db/erlang-rocksdb/-/archive/${PV}/erlang-rocksdb-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"/erlang-${P}
