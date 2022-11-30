# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2b3823edbc78a450db4891fd2b566ca0316a7876"

DESCRIPTION="A thin compatibility layer between Gray Stream Common Lisp implementations"
HOMEPAGE="https://common-lisp.net/project/trivial-gray-streams/"
SRC_URI="https://github.com/trivial-gray-streams/trivial-gray-streams/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

src_prepare() {
	default
	rm -rf ${PN}-test.asd test
}
