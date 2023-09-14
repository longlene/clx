# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d06fed2cc100aa3aed4373c117a72163f298f498"

DESCRIPTION="Common Lisp .Net Core Interop"
HOMEPAGE="https://github.com/Lovesan/bike"
SRC_URI="https://github.com/Lovesan/bike/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/uiop
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/trivial-features
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-tests.asd test tests.lisp ${PN}-examples.asd examples
}
