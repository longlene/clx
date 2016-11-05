# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Slack Real Time Messaging API Client"
HOMEPAGE="https://github.com/kkazuo/slack-client"
SRC_URI=""

EGIT_REPO_URI="https://github.com/kkazuo/slack-client.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/blackbird
	dev-lisp/babel
	dev-lisp/cl-async
	dev-lisp/drakma-async
	dev-lisp/event-glue
	dev-lisp/jonathan
	dev-lisp/safe-queue
	dev-lisp/websocket-driver
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_compile() {
	:
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
