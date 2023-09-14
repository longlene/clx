# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="13b53720306c0e6a13eccf4674d28ee5361127ae"

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
