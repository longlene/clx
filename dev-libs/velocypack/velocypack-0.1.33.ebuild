# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A fast and compact format for serialization and storage"
HOMEPAGE="https://github.com/arangodb/velocypack"
SRC_URI="https://github.com/arangodb/velocypack/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DBuildVelocyPackExamples=OFF
	)
	cmake-utils_src_configure
}
