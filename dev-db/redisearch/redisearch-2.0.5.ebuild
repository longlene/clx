# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake vcs-snapshot

DESCRIPTION="FullText Search module for redis"
HOMEPAGE="https://github.com/RedisLabsModules/RediSearch"
SRC_URI="https://github.com/RedisLabsModules/RediSearch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-db/redis
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
	-DRS_FORCE_NO_GITVERSION=Y
	)
	cmake_src_configure
}

src_install() {
	insinto /var/lib/redis/modules
	doins ${BUILD_DIR}/redisearch.so
	dodoc README.md
}
