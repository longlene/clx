# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e4711a69b3d6bf37b5727af05c3cfd03e8428ba3"

DESCRIPTION="A library of computational mathematics, science, and engineering"
HOMEPAGE="https://gitlab.common-lisp.net/antik/antik"
SRC_URI="https://gitlab.common-lisp.net/antik/antik/repository/archive.tar.gz?ref=${EGIT_COMMIT} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/gsll

	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/metabang-bind
	dev-lisp/named-readtables
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/lisp-unit
	dev-lisp/cffi
	dev-lisp/trivial-garbage
	dev-lisp/drakma
	dev-lisp/fare-utils
	dev-lisp/trivial-utf8
"
# static-vectors 
