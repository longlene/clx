# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1248de58e1d9c8b60eb6d28979625a9ae9f59d8e"

DESCRIPTION="Full-text search engine in Common Lisp"
HOMEPAGE="https://github.com/skypher/montezuma http://code.google.com/p/montezuma/"
SRC_URI="https://github.com/sharplispers/montezuma/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/babel
"

