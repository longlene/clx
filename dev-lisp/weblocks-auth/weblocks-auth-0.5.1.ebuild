# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A system to add an authentication to the Weblocks based site"
HOMEPAGE="https://github.com/40ants/weblocks-auth"
SRC_URI="https://github.com/40ants/weblocks-auth/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/dexador
	dev-lisp/jonathan
	dev-lisp/log4cl
	dev-lisp/quri
	dev-lisp/cl-strings
	dev-lisp/mito
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.lisp-expr
}
