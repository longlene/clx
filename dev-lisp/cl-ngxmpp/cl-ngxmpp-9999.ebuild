# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp library for XMPP RFCs"
HOMEPAGE="https://github.com/grouzen/cl-ngxmpp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/grouzen/cl-ngxmpp.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="example test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/blackbird
	dev-lisp/alexandria
	dev-lisp/usocket
	dev-lisp/cxml
	dev-lisp/babel
	dev-lisp/cl-plus-ssl
	dev-lisp/cl-base64
	dev-lisp/cl-sasl
"

src_prepare() {
	if ! use example ; then
		rm -rf cl-ngxmpp-client.examples.asd client/examples client/high/examples
	fi
	if ! use test ; then
		rm -rf cl-ngxmpp-test.asd cl-ngxmpp-client-test.asd client/test core/test
	fi
}

src_compile() {
	:
}
