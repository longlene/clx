# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="fea6cd18228d8895f09cda7ca2349779591c054a"

DESCRIPTION="Colorize is a Common Lisp application for colorizing source code."
HOMEPAGE="http://www.cliki.net/colorize"
SRC_URI="https://github.com/kingcons/colorize/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/html-encode
	dev-lisp/split-sequence
	dev-lisp/alexandria
	>=dev-lisp/hyperspec-7.0
"

src_prepare() {
	epatch "${FILESDIR}"/9999-hyperspec-pathname-gentoo.patch
}
