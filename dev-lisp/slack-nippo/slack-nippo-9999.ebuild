# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 git-r3

DESCRIPTION="Slack-Nippo"
HOMEPAGE="https://github.com/Rudolph-Miller/slack-nippo/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/Rudolph-Miller/slack-nippo.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-syntax
	dev-lisp/quri
	dev-lisp/babel
	dev-lisp/dexador
	dev-lisp/jonathan
	dev-lisp/anaphora
	dev-lisp/cl-ppcre
	dev-lisp/local-time
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
