# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit common-lisp-3 git-2
DESCRIPTION="Colorize is a Common Lisp application for colorizing source code."
HOMEPAGE="http://www.cliki.net/colorize"
SRC_URI=""

EGIT_REPO_URI="git://github.com/redline6561/colorize.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/html-encode
dev-lisp/split-sequence
~dev-lisp/hyperspec-7.0"

src_prepare() {
	epatch "${FILESDIR}"/${PV}-hyperspec-pathname-gentoo.patch
}
