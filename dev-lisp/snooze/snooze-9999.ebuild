# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 git-2

DESCRIPTION="Common Lisp RESTful web development"
HOMEPAGE="https://github.com/capitaomorte/snooze"
SRC_URI=""

EGIT_REPO_URI="https://github.com/capitaomorte/snooze.git"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/alexandria
dev-lisp/cl-ppcre
dev-lisp/closer-mop
dev-lisp/quri
dev-lisp/uiop
dev-lisp/parse-float
"

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all VERSION
}
