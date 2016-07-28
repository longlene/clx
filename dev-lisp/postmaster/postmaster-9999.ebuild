# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Email for humans"
HOMEPAGE="https://github.com/eudoxia0/postmaster"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/postmaster.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/mel-base
	dev-lisp/cl-smtp
	dev-lisp/trivial-types
	dev-lisp/trivial-mimes
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
