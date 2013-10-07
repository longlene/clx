# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EGIT_REPO_URI="http://www.princeton.edu/~tpapp/software/cl-cairo2.git/"

inherit common-lisp-2 git-2

DESCRIPTION="Common Lisp bindings for Cairo"
HOMEPAGE="http://common-lisp.net/project/cl-cairo2/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""

src_install() {
	rm -f *win*
	rm -f *mac*

	common-lisp-install *.{asd,lisp}

	common-lisp-symlink-asdf "${PN}"
	common-lisp-symlink-asdf "${PN}-x11"
}
