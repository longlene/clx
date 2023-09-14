# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="96970de51e9e100ed4b612f05157b4a8ab75422d"

DESCRIPTION="Common Lisp library for reading and writing JSON"
HOMEPAGE="https://github.com/copyleft/json-streams"
SRC_URI="https://github.com/copyleft/json-streams/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests
}

