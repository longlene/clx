# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit git-r3 common-lisp-3

DESCRIPTION="Emails and Common Lisp"
HOMEPAGE="https://github.com/deadtrickster/cl-mail"
SRC_URI=""

EGIT_REPO_URI="https://github.com/deadtrickster/cl-mail.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/string-case
	dev-lisp/trivial-backtrace
	dev-lisp/quri
	dev-lisp/log4cl
	test? ( dev-lisp/prove dev-lsip/cl-interpol dev-lisp/mw-qeuiv )
"

src_prepare() {
	use test || rm -rf t cl-mail.test.asd
}
