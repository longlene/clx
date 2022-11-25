# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="3fbf6e1421484f64c5bcf2ff3c4b96c6f0414f09"

DESCRIPTION="Common Lisp MySQL library"
HOMEPAGE="http://hackinghat.com/index.php/cl-mysql"
SRC_URI="https://github.com/hackinghat/cl-mysql/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cffi"

src_prepare() {
	default
	rm ${PN}-test.asd test*.lisp integration-test.lisp
}
