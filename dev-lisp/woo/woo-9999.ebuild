# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="A fast non-blocking HTTP server on top of libev"
HOMEPAGE="https://github.com/fukamachi/woo/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/woo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/lev
dev-lisp/swap-bytes
dev-lisp/cffi
dev-lisp/static-vectors
dev-lisp/fast-http
dev-lisp/quri
dev-lisp/fast-io
dev-lisp/trivial-utf8
dev-lisp/flexi-streams
dev-lisp/vom
dev-lisp/local-time
dev-lisp/alexandria
dev-lisp/split-sequence"

src_install() {
	common-lisp-install-sources src
	common-lisp-install-sources -t all README.md
	common-lisp-install-asdf ${PN}.asd clack-handler-woo.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf ${PN}-test.asd
	fi
}
