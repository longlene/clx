# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Optimized low-level websocket protocol parser written in Common Lisp"
HOMEPAGE="https://github.com/fukamachi/fast-websocket"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/fast-websocket.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fast-io
dev-lisp/trivial-utf8
dev-lisp/alexandria
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources README.markdown
}
