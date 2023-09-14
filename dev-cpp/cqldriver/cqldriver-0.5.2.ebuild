# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

DESCRIPTION="C++ driver for Cassandra/Scylla based on seastar framework"
HOMEPAGE="https://github.com/cpv-project/cpv-cql-driver"
SRC_URI="https://github.com/cpv-project/cpv-cql-driver/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-cpp/seastar
"
RDEPEND="${DEPEND}"
BDEPEND=""

CMAKE_USE_DIR="${S}"/src
