# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f7210275d12bbabd1cae3052657b980f34e6b165"

DESCRIPTION="Markless processor for Common Lisp"
HOMEPAGE="https://github.com/Shirakumo/cl-markless"
SRC_URI="https://github.com/Shirakumo/cl-markless/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
	dev-lisp/trivial-indent
"
BDEPEND=""

src_prepare() {
	default
	rm -r ${PN}-test.asd tests
}
