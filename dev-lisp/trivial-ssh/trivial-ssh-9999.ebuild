# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="An SSH client library for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/trivial-ssh"
SRC_URI=""
EGIT_REPO_URI="https://github.com/eudoxia0/trivial-ssh.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi
dev-lisp/usocket
dev-lisp/cl-fad
dev-lisp/trivial-graystreams
dev-lisp/babel
dev-lisp/split-sequence
"

src_install() {
	common-lisp-install-sources -t all README.md
	common-lisp-install-sources libssh2 src
	common-lsip-install-asdf ${PN}.asd ${PN}-libssh2.asd
	if use test ; then
		common-lisp-install-sources t
		common-lsip-install-asdf ${PN}-test.asd
	fi
	dodoc README.md
}
