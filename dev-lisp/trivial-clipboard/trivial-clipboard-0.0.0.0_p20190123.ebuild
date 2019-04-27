# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e9cdcaf52b3f91cc5a5b7ac8dc985d1619f0b514"

DESCRIPTION="trivial-clipboard let access system clipboard"
HOMEPAGE="https://github.com/snmsts/trivial-clipboard"
SRC_URI="https://github.com/snmsts/trivial-clipboard/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd test.lisp
}
