# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Provides LISP-N --- extensible namespaces in Common Lisp"
HOMEPAGE="https://github.com/guicho271828/lisp-namespace"
SRC_URI=""

EGIT_REPO_URI="https://github.com/guicho271828/lisp-namespace.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}.test.asd
}
