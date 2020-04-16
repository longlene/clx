# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ae02832f82daf4977abd667299b1f1fcc5481a8b"

DESCRIPTION="Lisp Web Toolkit"
HOMEPAGE="https://github.com/xh4/web-toolkit"
SRC_URI="https://github.com/xh4/web-toolkit/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/group-by
	dev-lisp/split-sequence
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
	dev-lisp/parse-number
	dev-lisp/trivial-gray-streams
	dev-lisp/plump
	dev-lisp/babel
	dev-lisp/cl-change-case
	dev-lisp/cl-fad
	dev-lisp/trivial-backtrace
	dev-lisp/usocket
	dev-lisp/cl-plus-ssl
	dev-lisp/chunga
	dev-lisp/cl-cont
	dev-lisp/local-time
	dev-lisp/parenscript
	dev-lisp/trivial-garbage
	dev-lisp/maxpc
	dev-lisp/ironclad
	dev-lisp/bordeaux-threads
	dev-lisp/cl-base64
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		local x
		for x in wt wt.component wt.css wt.dom wt.html wt.http wt.json wt.test wt.reactive wt.uri wt.utility wt.websocket; do
			sed -i "/defsystem ${x}\/test/,$d" ${x}.asd
		done
		rm -r test wt.test.asd
	fi
}

