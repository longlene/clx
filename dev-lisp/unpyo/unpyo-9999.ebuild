# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Puma を Common Lisp に移植してみる"
HOMEPAGE="https://github.com/quek/unpyo"
SRC_URI=""

EGIT_REPO_URI="https://github.com/quek/unpyo.git"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/anaphora
	dev-lisp/local-time
	dev-lisp/trivial-backtrace
	dev-lisp/trivial-mimes
	dev-lisp/iolib
	dev-lisp/puri
	dev-lisp/percent-encoding
	dev-lisp/rfc2388
	dev-lisp/split-sequence
	dev-lisp/cl-ppcre
	dev-lisp/temporary-file
	dev-lisp/fast-io
	dev-lisp/flexi-streams
	dev-lisp/com_informatimago_common-lisp_http
	dev-lisp/info_read-eval-print_html
	dev-lisp/info_read-eval-print_css
	dev-lisp/cl-base64
	dev-lisp/ironclad
	test? ( dev-lisp/fiveam dev-lisp/drakma )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd test
}
