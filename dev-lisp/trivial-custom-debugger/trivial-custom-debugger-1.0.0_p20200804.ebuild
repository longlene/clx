# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a560594a673bbcd88136af82086107ee5ff9ca81"

DESCRIPTION="Allows arbitrary functions to become the standard Lisp debugger"
HOMEPAGE="https://github.com/phoe/trivial-custom-debugger/"
SRC_URI="https://github.com/phoe/trivial-custom-debugger/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem #:trivial-custom-debugger\/test/,$d' \
		-i ${PN}.asd
	rm test.lisp
}
