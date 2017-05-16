# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs vcs-snapshot

EGIT_COMMIT="430251cb657f82c9a94d4ed72db6f5ea2e30f5d9"

DESCRIPTION="A minimal but powerful thread pool in ANSI C"
HOMEPAGE="https://github.com/Pithikos/C-Thread-Pool"
SRC_URI="https://github.com/Pithikos/C-Thread-Pool/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
	$(tc-getCC) -fPIC -c -o thpool.o thpool.c
	$(tc-getCC) -shared -o libthpool.so thpool.o -pthread
}

src_install() {
	insinto /usr/include
	doins thpool.h
	dolib.so libthpool.so
	dodoc README.md
}
