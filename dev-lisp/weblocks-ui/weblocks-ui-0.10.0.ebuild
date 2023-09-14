# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A set of widget for Weblocks framework, to simplify UI elements creation"
HOMEPAGE="https://github.com/40ants/weblocks-ui"
SRC_URI="https://github.com/40ants/weblocks-ui/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
	dev-lisp/weblocks-parenscript
	dev-lisp/quri
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr README.rst
}
