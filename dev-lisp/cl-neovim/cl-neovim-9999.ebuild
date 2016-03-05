# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2 vim-plugin

DESCRIPTION="Common Lisp client for neovim"
HOMEPAGE="https://github.com/adolenc/cl-neovim"
SRC_URI=""

EGIT_REPO_URI="https://github.com/adolenc/cl-neovim.git"

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
