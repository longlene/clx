# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp bindings for minimalistic GUI library, libui"
HOMEPAGE="https://github.com/jinwoo/cl-ui"
SRC_URI=""

EGIT_REPO_URI="https://github.com/jinwoo/cl-ui.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/trivial-main-thread
	x11-libs/libui
"
