# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Anonymous lambda literal in Common Lisp"
HOMEPAGE="https://github.com/windymelt/cl-punch/"
SRC_URI="https://github.com/windymelt/cl-punch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
