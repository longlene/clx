# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6977d64f976dfb3bbc0e4692e27271b3ce0faf40"

DESCRIPTION="Simple, regex-based HTTP router"
HOMEPAGE="https://github.com/jorams/rerout"
SRC_URI="https://github.com/jorams/rerout/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/quri
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd test.lisp
}
