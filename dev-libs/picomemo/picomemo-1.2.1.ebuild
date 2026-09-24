# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Portable OMEMO implementation in C"
HOMEPAGE="https://github.com/mierenhoop/picomemo"
SRC_URI="https://github.com/mierenhoop/picomemo/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ISC || ( Apache-2.0 MIT )"
SLOT="0"
KEYWORDS="~amd64"
IUSE="openssl"

RDEPEND="
	openssl? ( dev-libs/openssl:0= )
	!openssl? ( net-libs/mbedtls:3= )
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-lang/lua
	dev-util/pkgconf
"

src_compile() {
	local driver="mbedtls.c" pc="mbedcrypto-3"
	use openssl && { driver="openssl.c"; pc="openssl"; }
	export CFLAGS+=" $(pkg-config --cflags ${pc})"
	emake lib DRIVERS="hacl.c ${driver}" LIBS="$(pkg-config --libs ${pc})"
}

src_install() {
	local libdir
	libdir=$(get_libdir)
	dolib.a o/libpicomemo.a
	dolib.so o/libpicomemo.so.1.2.1
	dosym libpicomemo.so.1.2.1 usr/${libdir}/libpicomemo.so.1
	dosym libpicomemo.so.1 usr/${libdir}/libpicomemo.so
	doheader gen/omemo0.h gen/omemo2.h
	dodoc README.md
}
