# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d27b46388e6f3617779cf8c7608072d57457a577"

DESCRIPTION="Common Lisp implementation of Trie data structure"
HOMEPAGE="https://github.com/MatthewRock/cl-trie"
SRC_URI="https://github.com/MatthewRock/cl-trie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		rm -r t
		sed -e '/asdf:defsystem\ #:cl-trie\/tests/,$d' -i cl-trie.asd
	fi
}
