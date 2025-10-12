# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Fast caching software with a focus on low latency and cpu efficiency"
HOMEPAGE="
	https://pogocache.com/
	https://github.com/tidwall/pogocache
"
SRC_URI="https://github.com/tidwall/pogocache/archive/refs/tags/${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/mimalloc
	dev-libs/openssl
	sys-libs/liburing
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)

src_compile() {
	emake NOJEMALLOC=1
}

src_install() {
	dobin pogocache
	einstalldocs
}
