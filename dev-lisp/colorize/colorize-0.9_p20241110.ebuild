# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c41fcc5833ebcf184f48aaf31ab89a9a1c230464"

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
	default
	eapply "${FILESDIR}"/9999-hyperspec-pathname-gentoo.patch
}
