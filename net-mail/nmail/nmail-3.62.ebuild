# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Terminal-based email client"
HOMEPAGE="https://github.com/d99kris/nmail"
SRC_URI="https://github.com/d99kris/nmail/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/openssl
	net-libs/libetpan
	dev-libs/xapian
	dev-db/sqlite
"
RDEPEND="${DEPEND}"
BDEPEND=""
