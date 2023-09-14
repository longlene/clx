# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1d77982f9724665cebea6a26fefcf9c6faf3f9ea"

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
