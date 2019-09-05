# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="157037c8ee4958afca43a97594a77b030da552df"

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
