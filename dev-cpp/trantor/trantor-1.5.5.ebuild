# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A non-blocking I/O tcp network lib based on c++14/17"
HOMEPAGE="https://github.com/an-tao/trantor"
SRC_URI="https://github.com/an-tao/trantor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	net-dns/c-ares
"
RDEPEND="${DEPEND}"
BDEPEND=""
