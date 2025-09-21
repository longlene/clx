# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A toolkit around Curve25519 and Ed25519 key pairs"
HOMEPAGE="
	https://github.com/Syndace/libxeddsa/
"
SRC_URI="https://github.com/Syndace/libxeddsa/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libsodium
"
RDEPEND="${DEPEND}"
BDEPEND=""

