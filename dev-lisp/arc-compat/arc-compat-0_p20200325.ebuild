# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ef98c191a166924d6ab7bda8adb4246c7420dd4c"

DESCRIPTION="Arc compatible package"
HOMEPAGE="https://github.com/g000001/arc-compat"
SRC_URI="https://github.com/g000001/arc-compat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Aritstic License 2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fiveam
dev-lisp/named-readtables
dev-lisp/bordeaux-threads
dev-lisp/ironclad
dev-lisp/cl-fad"

