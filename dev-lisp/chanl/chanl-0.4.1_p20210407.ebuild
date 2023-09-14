# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="dec1dcf60fa9ce7f2967a6f23a7ce12ecc1aacca"

DESCRIPTION="Portable channel-based concurrency for Common Lisp"
HOMEPAGE="https://github.com/zkat/chanl"
SRC_URI="https://github.com/zkat/chanl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
"

src_prepare() {
	default
	sed -e '/defsystem "chanl\/examples/,$d' \
		-i ${PN}.asd
	rm -rf examples tests
}
