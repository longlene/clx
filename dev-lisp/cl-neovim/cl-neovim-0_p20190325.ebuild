# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vim-plugin

EGIT_COMMIT="7212d305206aaae331a3e2d0d2597b671cec01f4"

DESCRIPTION="Common Lisp client for neovim"
HOMEPAGE="https://github.com/adolenc/cl-neovim"
SRC_URI="https://github.com/adolenc/cl-neovim/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	app-editors/neovim
	dev-lisp/babel
	dev-lisp/split-sequence
	dev-lisp/form-fiddle
	dev-lisp/cl-messagepack-rpc
	dev-lisp/vom
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd t
}
	

src_install() {
	common-lisp-3_src_install
	vim-plugin_src_install
}
