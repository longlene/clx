# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Ascii Art generating routines"
HOMEPAGE="https://github.com/Blue-Sky-Skunkworks/cl-ascii-art/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Blue-Sky-Skunkworks/cl-ascii-art.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ansi-text
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all fonts
}
