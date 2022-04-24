# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="A set of UI widgets for Reblocks web framework"
HOMEPAGE=""
SRC_URI="https://github.com/40ants/reblocks-ui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/reblocks-parenscript
	dev-lisp/40ants-doc
	dev-lisp/parenscript
	dev-lisp/reblocks
	dev-lisp/log4cl
	dev-lisp/quri
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md version.lisp-expr
}
