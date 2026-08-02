# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Embeddable inference engine that streams MoE experts from disk"
HOMEPAGE="https://github.com/sqliteai/waste"
SRC_URI="https://github.com/sqliteai/waste/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	emake CC="$(tc-getCC)" CFLAGS="${CFLAGS} ${LDFLAGS}"
}

src_install() {
	dobin waste
	dolib.a libwaste.a
	dolib.so libwaste.so libwastevq.so
	insinto /usr/include
	doins src/waste.h
	dodoc README.md
}
