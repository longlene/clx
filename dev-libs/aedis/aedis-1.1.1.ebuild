# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An async redis client designed for simplicity and reliability"
HOMEPAGE="https://github.com/mzimbres/aedis"
SRC_URI="https://github.com/mzimbres/aedis/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSL-1.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/boost
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/include
	doins -r include/aedis{,.hpp}
	einstalldocs
}
