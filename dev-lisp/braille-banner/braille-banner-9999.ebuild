# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2

DESCRIPTION="banner printer in Common Lisp"
HOMEPAGE="https://github.com/g000001/braille-banner"
SRC_URI=""

EGIT_REPO_URI="https://github.com/g000001/braille-banner.git"

LICENSE="as"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/fiveam
dev-lisp/kmrcl
dev-lisp/babel
dev-lisp/fare-utils
dev-lisp/cl-unicode"

src_install() {
	common-lisp-install-sources -t all k14.bdf *.lisp *.asd
	common-lisp-install-asdf ${PN}
}
