# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="507bac1f7742d1b081fd8093d2bc1f95c97ed685"

DESCRIPTION="A native Lisp graphics math library with an emphasis on performance and correctness"
HOMEPAGE="https://github.com/mfiano/origin/"
SRC_URI="https://github.com/mfiano/origin/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/golden-utils
	dev-lisp/alexandria
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd test
}
