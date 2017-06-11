# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vim-plugin

EGIT_COMMIT="4b817fc2ff121b7a7dc46fc9df669f43956b7304"

DESCRIPTION="Common Lisp client for neovim"
HOMEPAGE="https://github.com/adolenc/cl-neovim"
SRC_URI="https://github.com/adolenc/cl-neovim/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	app-editors/neovim
	dev-lisp/babel
	dev-lisp/split-sequence
	dev-lisp/form-fiddle
	dev-lisp/cl-messsagepack
	dev-lisp/cl-async
	dev-lisp/bordeaux-threads
"

src_install() {
	common-lisp-3_src_install
	vim-plugin_src_install
}
