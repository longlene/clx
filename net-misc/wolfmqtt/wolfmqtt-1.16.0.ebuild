# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="A small, fast, portable MQTT client implementation"
HOMEPAGE="https://github.com/wolfSSL/wolfMQTT"
SRC_URI="https://github.com/wolfSSL/wolfMQTT/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/wolfssl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
