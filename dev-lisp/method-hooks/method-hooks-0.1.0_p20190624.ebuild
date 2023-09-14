# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1b765f66d149c0ae45e1aa7d650d1425282c4cc5"

DESCRIPTION="simple qualifiable hooks defined like methods with the option to modify the dispatch method and how dispatch happens"
HOMEPAGE="https://gitlab.com/Gnuxie/method-hooks"
SRC_URI="https://gitlab.com/Gnuxie/method-hooks/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/parachute )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd test
}
