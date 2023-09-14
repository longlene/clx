# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6a1c6a07715a8f47a94528a0fb15173e95c15ae8"

DESCRIPTION="A Common-Lisp library to validate your JSON schema"
HOMEPAGE="https://github.com/notmgsk/cl-json-schema/"
SRC_URI="https://github.com/notmgsk/cl-json-schema/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/yason
	dev-lisp/trivial-do
	dev-lisp/cl-ppcre
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd tests
}
