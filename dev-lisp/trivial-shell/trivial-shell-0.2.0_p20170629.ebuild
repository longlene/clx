# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e02ec191b34b52deca5d1c4ee99d4fa13b8772e0"

DESCRIPTION="OS and Implementation independent access to the shell"
HOMEPAGE="https://github.com/gwkkwg/trivial-shell"
SRC_URI="https://github.com/gwkkwg/trivial-shell/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/lift )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests
}
