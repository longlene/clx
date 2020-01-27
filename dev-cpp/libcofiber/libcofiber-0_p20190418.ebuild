# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

EGIT_COMMIT="6a23b90c089e7c77a2370b1497d9b67e366d0410"

DESCRIPTION="P0057-like C++ coroutines implemented via fibers"
HOMEPAGE="https://github.com/avdgrinten/libcofiber"
SRC_URI="https://github.com/avdgrinten/libcofiber/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_EXECSTACK=usr/lib*/${PN}.so

src_compile() {
	emake -f library.makefile
}

src_install() {
	insinto /usr/include
	doins -r include/cofiber{,.hpp}
	dolib.so bin/libcofiber.so
}
