# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="parameter setting framework for Common Lisp"
HOMEPAGE="https://github.com/mobius-eng/parameters"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mobius-eng/parameters.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/keyword-dispatch
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}

src_prepare() {
	eapply_user
	use test || rm -rf t tests ${PN}-extra-test.asd ${PN}-test.asd
}
