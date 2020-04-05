# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f5501e4372900813a9be4a557764b41636a7e250"

DESCRIPTION="Common Lisp Mustache Template Renderer"
HOMEPAGE="https://github.com/kanru/cl-mustache"
SRC_URI="https://github.com/kanru/cl-mustache/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
"

src_prepare() {
	default
	use test || rm -rf t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all *.lisp-expr
}
