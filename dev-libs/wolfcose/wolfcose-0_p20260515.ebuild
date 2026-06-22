# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

MY_COMMIT="b90b34abcba90aa7b8a895f4038616f3eb140308"

DESCRIPTION="Lightweight COSE and CBOR implementation using wolfSSL as crypto backend"
HOMEPAGE="https://github.com/wolfSSL/wolfCOSE"
SRC_URI="https://github.com/wolfSSL/wolfCOSE/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/wolfCOSE-${MY_COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND="dev-libs/wolfssl"
RDEPEND="${DEPEND}"

src_compile() {
	emake CC="$(tc-getCC)" AR="$(tc-getAR)" shared
	use static-libs && emake CC="$(tc-getCC)" AR="$(tc-getAR)" all
}

src_install() {
	dolib.so libwolfcose.so
	use static-libs && dolib.a libwolfcose.a
	insinto /usr/include/wolfcose
	doins include/wolfcose/wolfcose.h
	doins include/wolfcose/visibility.h
	dodoc README.md
}
