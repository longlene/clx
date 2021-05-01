# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="51cc9edcbbe13d9132fe12b0b197848f31513232"

DESCRIPTION="Implementation of several advanced heap data structures with priority queue and meld functionality in Common Lisp"
HOMEPAGE="https://github.com/sfrank/minheap"
SRC_URI="https://github.com/sfrank/minheap/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd test
}
