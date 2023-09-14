# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="An utility to define JavaScript dependencies for Weblocks widgets using Parenscript"
HOMEPAGE="https://github.com/40ants/weblocks-parenscript"
SRC_URI="https://github.com/40ants/weblocks-parenscript/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/weblocks
	dev-lisp/parenscript
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
