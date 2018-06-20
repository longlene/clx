# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4a39b762a0aa38850c88e0928486f75e55f15628"

DESCRIPTION="Common Lisp package for generating graphviz (dot) files"
HOMEPAGE="https://github.com/michaelw/cl-dot"
SRC_URI="https://github.com/michaelw/cl-dot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	sed -i '/static-file/d' ${PN}.asd
}
