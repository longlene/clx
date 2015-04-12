# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Create and manage virtual machines from Common Lisp"
HOMEPAGE="http://eudoxia.me/corona"
SRC_URI=""

EGIT_REPO_URI="https://github.com/eudoxia0/corona.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-virtualbox
dev-lisp/trivial-download
dev-lisp/trivial-types
dev-lisp/trivial-extract
dev-lisp/ironclad
dev-lisp/cl-fad
dev-lisp/log4cl
dev-lisp/anaphora
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
