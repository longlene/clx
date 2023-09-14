# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a6d28874e7efad547301d7dcde816cd5ac025178"

DESCRIPTION="Lockless data structures for Common Lisp"
HOMEPAGE="https://github.com/Shinmera/luckless"
SRC_URI="https://github.com/Shinmera/luckless/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/atomics
	dev-lisp/documentation-utils
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd tests.lisp
}
