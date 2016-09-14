# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="An emacs-like command bar for cl-cffi-gtk applications, along with key processing and command binding"
HOMEPAGE="https://github.com/stacksmith/gtk-emacs-like-input"
SRC_URI=""

EGIT_REPO_URI="https://github.com/stacksmith/gtk-emacs-like-input.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-cffi-gtk
"
