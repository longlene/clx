# Copyright 2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="973cef8357c8c9e5e5f85dceda7cb07e64648b20"

DESCRIPTION="A double array implementation for Common Lisp"
HOMEPAGE="https://github.com/carrotflakes/cl-double-array"
SRC_URI="https://github.com/carrotflakes/cl-double-array/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd ${PN}-benchmark.asd tests bench
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
