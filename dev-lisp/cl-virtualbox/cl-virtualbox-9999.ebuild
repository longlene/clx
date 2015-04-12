# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Control VirtualBox from Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/cl-virtualbox"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/cl-virtualbox"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
dev-lisp/uiop
dev-lisp/alexandria
dev-lisp/usocket
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
