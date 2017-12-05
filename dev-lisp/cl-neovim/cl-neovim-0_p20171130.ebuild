# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vim-plugin

EGIT_COMMIT="38d1e3fb6d77e76cdab0613d272d6b159e0ef0dd"

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
	dev-lisp/cl-messsagepack-rpc
	dev-lisp/vom
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd t
}
	

src_install() {
	common-lisp-3_src_install
	vim-plugin_src_install
}
