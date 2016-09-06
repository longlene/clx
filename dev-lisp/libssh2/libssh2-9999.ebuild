# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Libssh2 bindings"
HOMEPAGE="https://github.com/alxchk/cl-libssh2"
SRC_URI=""

EGIT_REPO_URI="https://github.com/alxchk/cl-libssh2.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	net-libs/libssh2
	dev-lisp/babel
	dev-lisp/cffi
	dev-lisp/cl-fad
	dev-lisp/hu_dwim_logger
	dev-lisp/split-sequence
	dev-lisp/trivial-gray-streams
	dev-lisp/usocket
"

src_prepare() {
	eapply_user
	use test || rm -rf test ${PN}.test.asd
}
