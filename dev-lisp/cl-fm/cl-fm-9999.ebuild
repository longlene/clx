# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="A graphical File Manager in Common Lisp, using cl-cffi-gtk"
HOMEPAGE="https://github.com/stacksmith/cl-fm"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stacksmith/cl-fm.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cffi-gtk
	dev-lisp/gtk-emacs-like-input
	dev-lisp/cl-ppcre
	dev-lisp/external-program
"
