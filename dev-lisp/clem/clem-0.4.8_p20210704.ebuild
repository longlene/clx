# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2a9a7699dcfba25a857c11b81291d1edef00c1f"

DESCRIPTION="A matrix library for common lisp"
HOMEPAGE="https://github.com/slyrus/clem"
SRC_URI="https://github.com/slyrus/clem/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="doc test"

DEPEND=""
RDEPEND="${DEPEND}
	doc? ( dev-lisp/smarkup )
"

src_prepare() {
	default
	use doc || rm -r ${PN}-doc.asd doc
	use test || rm -r ${PN}-test.asd test ${PN}-benchmark.asd benchmark
}
