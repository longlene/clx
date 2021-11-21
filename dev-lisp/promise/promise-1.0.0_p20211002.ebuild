# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

EGIT_COMMIT="81567b0677366cd93840c27f03f6c8e1e89f0e4a"

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
