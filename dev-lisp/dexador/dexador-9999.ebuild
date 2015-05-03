# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Yet another HTTP client for Common Lisp"
HOMEPAGE="http://ultra.wikia.com/wiki/Dexador"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fukamachi/dexador.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/usocket
dev-lisp/fast-http
dev-lisp/quri
dev-lisp/fast-io
dev-lisp/babel
dev-lisp/cl-ppcre
dev-lisp/cl-cookie
dev-lisp/trivial-mimes
dev-lisp/chipz
dev-lisp/cl-base64
dev-lisp/cl-plus-ssl
dev-lisp/bordeaux-threads
dev-lisp/alexandria
"

src_install() {
	common-lisp-install-sources -t all src README.markdown
	common-lisp-install-asdf dexador.asd
	if use test ; then
		common-lisp-install-sources t
		common-lisp-install-asdf dexador-test.asd
	fi
}
