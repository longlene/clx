# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

EGIT_COMMIT="99354525a9d9c3765234201c1dc195c7e0e8990b"

DESCRIPTION="A simple, independent library implementing a promise mechanism for asynchronous operations"
HOMEPAGE="https://github.com/Shinmera/promise"
SRC_URI="https://github.com/Shinmera/promise/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test.lisp
}
