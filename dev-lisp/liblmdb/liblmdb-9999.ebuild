# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 git-r3

DESCRIPTION="Low-level LMDB bindings"
HOMEPAGE="https://github.com/antimer/liblmdb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/antimer/liblmdb.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-db/lmdb
	dev-lisp/cffi
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
