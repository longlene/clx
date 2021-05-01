# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9170abfa15d4f7b865b453e30d487516f9a2128f"

DESCRIPTION="Puma を Common Lisp に移植してみる"
HOMEPAGE="https://github.com/quek/unpyo"
SRC_URI="https://github.com/quek/unpyo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

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
