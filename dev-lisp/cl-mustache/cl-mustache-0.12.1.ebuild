# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3

DESCRIPTION="Common Lisp Mustache Template Renderer"
HOMEPAGE="https://github.com/kanru/cl-mustache"
SRC_URI="https://github.com/kanru/cl-mustache/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
"

src_prepare() {
	use test || rm -rf t ${PN}-test.asd
	eapply_user
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all *.lisp-expr
}
