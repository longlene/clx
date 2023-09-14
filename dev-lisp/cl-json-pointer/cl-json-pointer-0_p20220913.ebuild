# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f6760e2a02972783f96b92a15f801e14a6828e0c"

DESCRIPTION="JSON Pointer processor for Common Lisp"
HOMEPAGE="https://github.com/y2q-actionman/cl-json-pointer"
SRC_URI="https://github.com/y2q-actionman/cl-json-pointer/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/closer-mop
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
