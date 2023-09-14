# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3b9cd076c0bbbfe02ef414369bcc5ba478b94549"

DESCRIPTION="Common Lisp interface to Tokyo Cabinet"
HOMEPAGE="https://github.com/keithj/cl-tokyo-cabinet"
SRC_URI="https://github.com/keithj/cl-tokyo-cabinet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/deoxybyte-systems
	dev-lisp/cffi
	dev-db/tokyocabinet
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
