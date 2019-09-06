# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6af1992feeccda589ccc4d924d83028d3f820207"

DESCRIPTION="Common Lisp Library for the Gearman distributed job system"
HOMEPAGE="https://github.com/taksatou/cl-gearman"
SRC_URI="https://github.com/taksatou/cl-gearman/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/usocket
	dev-lisp/split-sequence
	dev-lisp/babel
	dev-lisp/alexandria
	test? ( dev-lisp/cl-test-more )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
