# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="A RocksDB compliant high performance scalable embedded key-value store"
HOMEPAGE="https://www.speedb.io/"
SRC_URI="https://github.com/speedb-io/speedb/archive/refs/tags/speedb/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
