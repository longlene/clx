# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="157f5cc720ebc06488ecad3ef5589918e7831b29"

DESCRIPTION="SQL document database with full history"
HOMEPAGE="https://github.com/endatabas/endb"
SRC_URI="https://github.com/endatabas/endb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/archive
	dev-lisp/bordeaux-threads
	dev-lisp/cffi
	dev-lisp/cl-base64
	dev-lisp/cl-bloom
	dev-lisp/cl-murmurhash
	dev-lisp/cl-ppcre
	dev-lisp/jzon
	dev-lisp/flexi-streams
	dev-lisp/fset
	dev-lisp/local-time
	dev-lisp/periods
	dev-lisp/sha1
	dev-lisp/trivial-backtrace
	dev-lisp/trivial-gray-streams
	dev-lisp/trivial-utf8
	dev-lisp/trivia
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
