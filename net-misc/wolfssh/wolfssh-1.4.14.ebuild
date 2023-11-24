# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools vcs-snapshot

DESCRIPTION="A small, fast, portable SSH implementation"
HOMEPAGE="https://github.com/wolfSSL/wolfssh"
SRC_URI="https://github.com/wolfSSL/wolfssh/archive/refs/tags/v${PV}-stable.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/wolfssl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	eautoreconf
}
