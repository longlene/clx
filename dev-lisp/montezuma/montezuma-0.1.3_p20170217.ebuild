# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ee2129eece7065760de4ebbaeffaadcb27644738"

DESCRIPTION="Full-text search engine in Common Lisp"
HOMEPAGE="https://github.com/skypher/montezuma http://code.google.com/p/montezuma/"
SRC_URI="https://github.com/sharplispers/montezuma/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/cl-fad
	dev-lisp/babel
	test? ( dev-lisp/trivial-timeout )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -e '/defsystem\ #:montezuma-tests/,$d' -i montezuma.asd
		rm -rf lucene-in-action tests
	fi
}
