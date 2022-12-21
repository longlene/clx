# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9ab6e64a30261df109549d21ee7940df87db66bb"

DESCRIPTION="Bind extends the idea of of let and destructing in a uniform syntax"
HOMEPAGE="https://github.com/gwkkwg/metabang-bind"
SRC_URI="https://github.com/gwkkwg/metabang-bind/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/lift )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd unit-tests
}

