# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="STOMP protocol in Common Lisp"
HOMEPAGE="https://github.com/cpc26/cl-stomp"
SRC_URI=""

EGIT_REPO_URI="https://github.com/cpc26/cl-stomp.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/babel
"

src_prepare() {
	eapply_user
	rm -f Makefile
	use example || rm -f example.lisp ${PN}-example.asd
}

