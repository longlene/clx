# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="5a25b1724e16ac1448045f5dd2fb11ba5694c83b"

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
	use test || rm -rf ${PN}-test.asd unit-tests
}

