# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="JSON encoder and decoder"
HOMEPAGE="https://rudolph-miller.github.io/jonathan/overview.html"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Rudolph-Miller/jonathan.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-syntax
dev-lisp/fast-io
dev-lisp/trivial-types
dev-lisp/babel
dev-lisp/proc-parse
dev-lisp/cl-ppcre
dev-lisp/cl-annot
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
