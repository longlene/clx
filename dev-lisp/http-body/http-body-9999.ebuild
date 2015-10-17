# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="HTTP POST data parser"
HOMEPAGE="https://github.com/fukamachi/http-body"
#SRC_URI=""

EGIT_REPO_URI="https://github.com/fukamachi/http-body.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/fast-http
	dev-lisp/jonathan
	dev-lisp/trivial-gray-streams
	dev-lisp/quri
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/cl-ppcre
	dev-lisp/cl-utilities
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
