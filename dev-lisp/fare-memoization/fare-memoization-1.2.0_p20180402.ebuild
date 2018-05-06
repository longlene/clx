# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8b43ac6bcc0057d1a92052e39b6d34c05c2eb7e4"

DESCRIPTION="a library for memoizing functions"
HOMEPAGE="https://github.com/fare/fare-memoization"
SRC_URI="https://github.com/fare/fare-memoization/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ "fare-memoization\/test"/,$d' ${PN}.asd
		rm memoization-test.lisp
	fi
}
