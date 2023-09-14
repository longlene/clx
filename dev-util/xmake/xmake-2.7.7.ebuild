# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A cross-platform build utility based on Lua"
HOMEPAGE="https://xmake.io"
SRC_URI="https://github.com/xmake-io/xmake/releases/download/v${PV}/xmake-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	./configure --prefix=/usr --mode=debug || die "configure failed"
}

