# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0de510fec2644ab1341e72ec01d7a30629919593"

DESCRIPTION="Common Lisp Macros for Egison Pattern Matching"
HOMEPAGE="https://github.com/zeptometer/egison-common-lisp"
SRC_URI="https://github.com/zeptometer/egison-common-lisp/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/optima
	test? ( dev-lisp/fiveam dev-lisp/mockingbird )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}.test.asd test
}
