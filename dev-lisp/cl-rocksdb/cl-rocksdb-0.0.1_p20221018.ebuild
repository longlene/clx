# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ccb75b3f33448733680c4d32b826d58647afad6f"

DESCRIPTION="RocksDB binding for Common Lisp"
HOMEPAGE="https://github.com/veer66/cl-rocksdb"
SRC_URI="https://github.com/veer66/cl-rocksdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
